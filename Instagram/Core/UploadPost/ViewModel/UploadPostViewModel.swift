//
//  UploadPostViewModel.swift
//  Instagram
//
//  Created by Martin Wainaina on 14/12/2023.
//

import Foundation
import SwiftUI
import PhotosUI
import Firebase

@MainActor
class UploadPostViewModel: ObservableObject {
    /**
     ObservableObject - Our view is Observing whether there is somthing that has changed
     Published triggers the change with the updated state
     @MainActor is linked to the main thread the sync await.
     */
    @Published var selectedImage: PhotosPickerItem?{
        didSet{ Task { await loadImage(fromItem: selectedImage) } }
    }
    @Published var postImage: Image?
    private var uiImage: UIImage?
    
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item = item else { return }
        
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.uiImage = uiImage
        self.postImage = Image(uiImage: uiImage)
    }
    
    func uploadPost(caption: String) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let uiImage = uiImage else { return }
        
        let postRef = Firestore.firestore().collection("posts").document() // generate document id
        guard let imageUrl = try await ImageUploader.uploadImage(image: uiImage) else { return } // upload image and get image url
        let post = Post(id: postRef.documentID, ownerUid: uid, caption: caption, likes: 0, imageUrl: imageUrl, timestamp: Timestamp())
        guard let encodedPost = try? Firestore.Encoder().encode(post) else { return } // encode post
    
        try await postRef.setData(encodedPost) //post
    }
}
