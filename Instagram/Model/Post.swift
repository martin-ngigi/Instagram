//
//  Post.swift
//  Instagram
//
//  Created by Martin Wainaina on 13/12/2023.
//

import Foundation
import Firebase

struct Post: Identifiable, Hashable, Codable{
    let id: String
    let ownerUid: String
    let caption: String
    let likes: Int
    let imageUrl: String
    let timestamp: Timestamp
    var user: User?
}

extension Post{
    static var MOCK_POSTS: [Post] = [
        
        .init(id: NSUUID().uuidString,
              ownerUid: NSUUID().uuidString,
              caption: "This is some test caption for now",
              likes: 123, imageUrl: "black-panther-1",
              timestamp: Timestamp(),
              user: User.MOCK_USERS[0]
             ),
        
        .init(id: NSUUID().uuidString,
              ownerUid: NSUUID().uuidString,
              caption: "Wakanda forever",
              likes: 104,
              imageUrl: "black-panther-2",
              timestamp: Timestamp(),
              user: User.MOCK_USERS[1]
             ),
        
        .init(id: NSUUID().uuidString, 
              ownerUid: NSUUID().uuidString,
              caption: "Iron Man",
              likes: 77,
              imageUrl: "black-panther-3",
              timestamp: Timestamp(),
              user: User.MOCK_USERS[2]
             ),
        
        .init(id: NSUUID().uuidString, 
              ownerUid: NSUUID().uuidString,
              caption: "Veno is hungry. Time to eat",
              likes: 89, imageUrl: "front",
              timestamp: Timestamp(),
              user: User.MOCK_USERS[3]
             ),
        
        .init(id: NSUUID().uuidString,
              ownerUid: NSUUID().uuidString,
              caption: "This is some test caption for now",
              likes: 33, imageUrl: "black-panther-1",
              timestamp: Timestamp(),
              user: User.MOCK_USERS[4]
             )
    ]
}
