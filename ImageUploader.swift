//
//  ImageUploader.swift
//  Instagram
//
//  Created by Martin Wainaina on 05/01/2024.
//

import UIKit
import Firebase
import FirebaseStorage


struct ImageUploader {
    static func uploadImage(image: UIImage) async throws -> String? {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return nil } // reduce image size
        let filenaname = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_images/\(filenaname)")
        
        do {
            let _ = try await ref.putDataAsync(imageData)
            let url = try await ref.downloadURL()
            return url.absoluteString
        }
        catch {
            print("DEBUG: Failed to download image with error \(error.localizedDescription)")
            return nil
                  
        }
    }
}
