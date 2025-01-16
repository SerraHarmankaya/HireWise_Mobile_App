//
//  PostCellViewModel.swift
//  HireWise_App
//
//  Created by Serra Harmankaya on 5.01.2025.
//

import SwiftUI

class PostCellViewModel: ObservableObject {
    
    @Published var post: Post
    @Published var user: User?
    let currentUser: User
    
    init(post: Post, currentUser: User) {
        self.post = post
        self.currentUser = currentUser
        self.fetchUser(userId: post.user)
        checkIfUserLikedPost()
    }
    
    func fetchUser(userId: String) {
        
        AuthServices.requestDomain = "http://localhost:3000/users/\(userId)"
        AuthServices.fetchUser(id: userId) { result in
            switch result {
            case .success(let data):
                guard let user = try? JSONDecoder().decode(User.self, from: data as! Data) else { return }
                DispatchQueue.main.async {
                    self.user = user
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func like() {
        RequestServices.requestDomain = "http://localhost:3000/posts/\(self.post.id)/like"
        
        RequestServices.likePost(id: self.post.id) { result in
            print("The post has been liked")
        }
        
        self.post.didlike = true
        
    }
    
    func unlike() {
        RequestServices.requestDomain = "http://localhost:3000/posts/\(self.post.id)/unlike"
        
        RequestServices.likePost(id: self.post.id) { result in
            print("The post has been unliked")
        }
        
        self.post.didlike = false
    }
        
    func checkIfUserLikedPost() {
        if(self.post.likes.contains(self.currentUser.id)) {
            self.post.didlike = true
        }
        else{
            self.post.didlike = false
        }
    }
    
}
