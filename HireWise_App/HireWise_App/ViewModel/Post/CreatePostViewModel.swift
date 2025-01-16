//
//  CreatePostViewModel.swift
//  HireWise_App
//
//  Created by Serra Harmankaya on 1.01.2025.
//

//import Foundation
import SwiftUI

class CreatePostViewModel: ObservableObject {
    
    func uploadPost(text: String, image: UIImage?) {
       
        guard let user = AuthViewModel.shared.currentUser else {
            return
        }
        
        RequestServices.requestDomain = "http://localhost:3000/posts"
        
        RequestServices.postExperience(text: text, user: user.name , username: user.username, userId: user.id) { result in
            
            if let image {
                if let id = result?["_id"]! {
                    print(id)
                    ImageUploader.uploadImage(paramName: "upload", fileName: "image1", image: image, urlPath: "/uploadPostImage/\(id)")
                    
                    print("Gönderilen URL:", "http://localhost:3000/uploadPostImage/\(id)")

                    print("/uploadPostImage/\(id)")
                }
            }
        }
        
    }
}
