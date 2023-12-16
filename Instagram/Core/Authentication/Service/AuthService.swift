//
//  AuthService.swift
//  Instagram
//
//  Created by Martin Wainaina on 15/12/2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestoreSwift
import Firebase

/**
 MainActor annotates this as main thread, Main thread is responsible for updating the UI and handling simple UI updates
 Background threads are responsible for api calls and heavy computations
 */

class AuthService{
    @Published var userSession: FirebaseAuth.User?
    static let shared = AuthService()
    
    init() {
        
    }

    @MainActor
    func login(withEmail email: String, password: String) async throws{
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
        }
        catch {
            print("DEBUG: Failed to login user with error \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func createUser(email: String, password: String, username: String) async throws{
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            try await uploadUserData(uid: result.user.uid, username: username, email: email)
        }
        catch {
            print("DEBUG: Failed to register user with error \(error.localizedDescription)")
        }
        
    }
    
    func loadUserData() async throws {
        
    }
    
    func signOut() {
        try? Auth.auth().signOut() // signout from firebase
        self.userSession = nil // clear session
    }
    
    private func uploadUserData(uid: String, username: String, email: String) async throws {
        let user = User(id: uid, username: username, email: email)
        
        //guard let encodedUser = try? Firestore.Encoder().encode(user) else { return }
        //try? await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
        // OR
        
        do{
            let encodedUser = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
        }
        catch{
            print("DEBUG: Failed to upload user data with error \(error.localizedDescription) ")
        }
    }
}
