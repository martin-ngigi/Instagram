//
//  PostService.swift
//  Instagram
//
//  Created by Martin Wainaina on 07/01/2024.
//

import Foundation
import Firebase

struct PostService {
    
    private static let postsCollection = Firestore.firestore().collection("posts")
    
    static func fetchFeedPosts() async throws -> [Post] {
        
        let snapshot = try await postsCollection.getDocuments()

        var posts = try snapshot.documents.compactMap({ try $0.data(as: Post.self) })
        
        // fetch user data that corresponds to that post... but first we assign the user object to that post using user uid.
        for i in 0 ..< posts.count{
            let post = posts[i]
            let ownerUid = post.ownerUid
            let postUser = try await UserService.fetchUser(withUid: ownerUid)
            posts[i].user = postUser
        }
        
        return posts
    }
    
    static func fetchUserPosts(uid: String) async throws -> [Post] {
        let snapshot = try await postsCollection.whereField("ownerUid", isEqualTo: uid).getDocuments()
        return try snapshot.documents.compactMap({ try $0.data(as: Post.self) })
    }
}
