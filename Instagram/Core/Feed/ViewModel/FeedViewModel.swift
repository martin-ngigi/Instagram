//
//  FeedViewModel.swift
//  Instagram
//
//  Created by Martin Wainaina on 07/01/2024.
//

import Foundation
import Firebase

class FeedViewModel: ObservableObject {
    @Published var posts = [Post]() // initialize empty array
    
    init() {
        Task { try await fetchPosts() }
    }
    
    @MainActor
    func fetchPosts() async throws{
        let snapshot = try await Firestore.firestore().collection("posts").getDocuments()
        
        // METHOD 1
        /**
        self.posts = try snapshot.documents.compactMap({ documnent in
            let post = try documnent.data(as: Post.self)
            return post
        })
        **/
        
        // OR
        // METHOD 2
        self.posts = try snapshot.documents.compactMap({ try $0.data(as: Post.self) })
        
        // fetch user data that corresponds to that post... but first we assign the user object to that post using user uid.
        for i in 0 ..< posts.count{
            let post = posts[i]
            let ownerUid = post.ownerUid
            let postUser = try await UserService.fetchUser(withUid: ownerUid)
            posts[i].user = postUser
        }
        
       
        
    }
}
