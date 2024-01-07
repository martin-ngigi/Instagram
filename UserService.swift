//
//  Services.swift
//  Instagram
//
//  Created by Martin Wainaina on 02/01/2024.
//

import Foundation
import Firebase

struct UserService{
    
    static func fetchUser(withUid uid: String) async throws -> User{
        
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        return try snapshot.data(as: User.self)
    }
    
    /*1. Simple method*/
    @MainActor
    static func fetchAllUsers() async throws -> [User] {
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        return snapshot.documents.compactMap({ try? $0.data(as: User.self) }) // $0 converts documents data to User
      
    }
    
    /*Long method  */
    @MainActor
    static func fetchAllUsers2() async throws -> [User] {
        var users = [User]() // users array
        
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        let documents = snapshot.documents
        
        for doc in documents {
            //print(doc.data())
            guard let user = try? doc.data(as: User.self) else { return users }
            users.append(user)
        }
        
        return users
    }
    
    
}
