//
//  PostCellView.swift
//  HireWise_App
//
//  Created by Serra Harmankaya on 18.10.2024.
//

import SwiftUI
import Kingfisher

struct PostCellView: View {
    
    
    @ObservedObject var viewModel: PostCellViewModel
    
    var didLike: Bool { return viewModel.post.didlike ?? false }
   
    init(viewModel: PostCellViewModel) {
        self.viewModel = viewModel
    }
   
//    var post: String
//    var postImage: String? // String olarak aldık çünkü databaseden URL olarak çekicez.
//    
    var body: some View {
        //Text("Hello, World!")
        VStack{
            HStack(alignment: .top, spacing: 10, content: {
                if let avatarExists = self.viewModel.currentUser.avatarExists, avatarExists == true {
                    KFImage(URL(string: "http://localhost:3000/users/\(self.viewModel.currentUser.id)/avatar"))
                            .resizable()
                            .scaledToFit()
                            .frame(width: 44, height: 44)
                            .clipShape(Circle())
                }
                else {
                    Image("Profile")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 44, height: 44)
                        .clipShape(Circle())
                        .overlay( // Kenar ekleme
                            Circle()
                                .stroke(Color.gray, lineWidth: 2) // Gri kenar ve kalınlık
                        )
                }
                
                VStack(alignment: .leading, spacing: 10,
                       content: {
                    (
                        Text("\(self.viewModel.post.username) ")
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                        +
                        Text("@\(self.viewModel.post.username)")
                            .foregroundColor(.gray)
                    )
                    
                    Text(self.viewModel.post.text)
                        .frame(maxHeight: 100, alignment: .top)
                    
                    
//                    if let image = postImage {
//                        GeometryReader { proxy in
//                            Image(image)
//                                .resizable()
//                                .aspectRatio(contentMode: .fill)
//                                .frame(width: proxy.frame(in: .global).width, height: 250)
//                                .cornerRadius(15)
//                        }
//                        .frame(height: 250)
//                    }
//                    ///////////////////////////////////
//                    if let imageId = viewModel.post.id{
//                        if viewModel.post.image == "true" {
//                            
//                            GeometryReader { proxy in
//                                
//                                KFImage(URL(string: "http://localhost:3000/posts/\(imageId)/image"))
//                                    .resizable()
//                                    .aspectRatio(contentMode: .fill)
//                                    .frame(width: proxy.frame(in: .global).width, height: 250)
//                                    .cornerRadius(15)
//                                
//                            }
//                            .frame(height: 250)
//                        }
//                    }
                        
                })
                Spacer()
                
            })
            
            // Cell Bottom
            
            HStack(spacing: 50 ,content: {
                
                Button(action: {
                    
                    if(self.didLike){
                        self.viewModel.unlike()
                    }
                    else {
                        self.viewModel.like()
                    }
                   
                }, label: {
                    
                    if(self.didLike == false) {
                        Image(systemName: "heart")
                            .resizable()
                            .frame(width: 18, height: 18)
                            .foregroundColor(Color.HW)
                    }
                    else {
                        Image(systemName: "heart")
                            .resizable()
                            .renderingMode(.template)
                            .foregroundStyle(.red)
                            .frame(width: 18, height: 18)
                            .foregroundColor(Color.HW)
                    }
                    
                }).foregroundColor(.gray)
                
                Button(action: {
                    
                }, label: {
                    Image(systemName: "text.bubble")
                        .resizable()
                        .frame(width: 18, height: 20)
                        .foregroundColor(Color.HW)
                    
                })
                .foregroundColor(.gray)
                
                Button(action: {
                    
                }, label: {
                    Image(systemName: "square.and.arrow.down")
                        .resizable()
                        .frame(width: 18, height: 21)
                        .foregroundColor(Color.HW)
                    
                })
                .foregroundColor(.gray)
            })
            
            //.padding()
            
        }
    }
}

//#Preview {
//    PostCellView(post: myText)
//}
//

var myText = "Hello everyone, I'll be sharing my very first interview Experience."
