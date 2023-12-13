//
//  User.swift
//  Instagram
//
//  Created by Martin Wainaina on 13/12/2023.
//

import Foundation

struct User: Identifiable, Codable{
    let id: String
    var username: String
    var profileImageUrl: String?
    var fullname: String?
    var bio: String?
    var email: String
}

extension User{
    static var MOCK_USERS: [User] = [
        .init(id: NSUUID().uuidString, username: "martin_wainaina", profileImageUrl: "black-panther-1", fullname: "Martin Wainaina", bio: "The world belongs to you", email: "martin@gmail.com"),
        .init(id: NSUUID().uuidString, username: "venom", profileImageUrl: "black-panther-2", fullname: "Eddie Brock", bio: "Venom", email: "venom@gmail.com"),
        .init(id: NSUUID().uuidString, username: "ironman", profileImageUrl: "black-panther-3", fullname: "Tony Start", bio: "Playboy & Billionaire", email: "ironman@gmail.com"),
        .init(id: NSUUID().uuidString, username: "blackpanther", profileImageUrl: "black-panther-1", fullname: nil, bio: "The world belongs to you", email: "blackpanther@gmail.com"),
        .init(id: NSUUID().uuidString, username: "spider_man", profileImageUrl: "black-panther-1", fullname: "Peter Parker", bio: "Test bio", email: "spiderman@gmail.com"),
    ]
}
