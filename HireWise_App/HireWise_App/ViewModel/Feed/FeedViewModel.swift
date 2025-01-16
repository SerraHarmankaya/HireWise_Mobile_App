//
//  FeedViewModel.swift
//  HireWise_App
//
//  Created by Serra Harmankaya on 4.01.2025.
//

import Foundation

class FeedViewModel: ObservableObject {
    
    @Published var posts: [Post] = []
    
    init() {
        fetchFeed()
    }
    
    func fetchFeed() {
        RequestServices.requestDomain = "http://localhost:3000/posts"
            
        RequestServices.fetchFeed { result in
            switch result {
            case .success(let data):
                guard let posts = try? JSONDecoder().decode([Post].self, from: data as! Data) else { return }
                DispatchQueue.main.async {
                    self.posts = posts
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
