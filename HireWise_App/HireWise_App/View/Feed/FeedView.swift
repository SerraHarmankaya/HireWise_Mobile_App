//
//  FeedView.swift
//  HireWise_App
//
//  Created by Serra Harmankaya on 15.10.2024.
//

import SwiftUI

struct FeedView: View {
    
    @ObservedObject var viewModel = FeedViewModel()
    
    let user: User
    
    var body: some View {
        
        RefreshableScrollView {
            ScrollView(.vertical, showsIndicators: false,
                       content: {
                LazyVStack(spacing: 18){
                    
                    ForEach(viewModel.posts) { post in
                        PostCellView(viewModel: PostCellViewModel(post: post, currentUser: user))
                        
                        Divider()
                    }
                    
                }
                .padding(.top)
                .padding(.horizontal)
                .zIndex(0)
            })
        } onRefresh: { control in
            DispatchQueue.main.async {
                self.viewModel.fetchFeed()
                control.endRefreshing()
            }
        }

    }
}

//#Preview {
//    FeedView()
//}
