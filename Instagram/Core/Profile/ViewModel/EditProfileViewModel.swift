//
//  EditProfileViewModel.swift
//  Instagram
//
//  Created by Martin Wainaina on 03/01/2024.
//

import Foundation
import PhotosUI
import SwiftUI
import Firebase

@MainActor
class EditProfileViewModel: ObservableObject {
    
    @Published var user: User
    
    @Published var selectedImage: PhotosPickerItem?{
        didSet{ Task { await loadImage(fromItem: selectedImage) } }
    }
    @Published var profileImage: Image?
    
    @Published var fullname = ""
    @Published var bio = ""
    
    private var uiImage: UIImage?
    
    init(user: User){
        self.user = user
        
        // if we have user data, set it in the edit text fields
        if let fullname = user.fullname {
            self.fullname = fullname
        }
        
        if let bio = user.bio {
            self.bio = bio
        }
    }
    
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item = item else { return }
        
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.uiImage = uiImage
        self.profileImage = Image(uiImage: uiImage)
    }
    
    func updateUserData() async throws {
        // update profile image only if changed
        
        var data = [String: Any]() // initialize data dictionary i.e. map
        
        if let uiImage = uiImage {
            let imageUrl = try? await ImageUploader.uploadImage(image: uiImage)
            data["profileImageUrl"] = imageUrl
        }
        
        // update name only if changed
        if !fullname.isEmpty && user.username != fullname {
            data["fullname"] = fullname
        }
        
        // update bio only if changed
        if !bio.isEmpty && user.bio != bio {
            data["bio"] = bio
        }
        
        if !data.isEmpty {
            try await Firestore.firestore().collection("users").document(user.id).updateData(data)
        }
    }
}
