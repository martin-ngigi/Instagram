//
//  UploadPostViewModel.swift
//  Instagram
//
//  Created by Martin Wainaina on 14/12/2023.
//

import Foundation
import SwiftUI
import PhotosUI

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
    
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item = item else { return }
        
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.postImage = Image(uiImage: uiImage)
    }
}
