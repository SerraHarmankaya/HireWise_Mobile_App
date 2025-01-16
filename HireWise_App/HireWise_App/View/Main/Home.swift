//
//  Home.swift
//  HireWise_App
//
//  Created by Serra Harmankaya on 15.10.2024.
//

import SwiftUI

struct Home: View {
    
    @Binding var x : CGFloat
    @State var showCreatePost = false
    @State var text = ""
    
    let user: User
    
    var body: some View {
        
        VStack {
            ZStack {
                
                TabView {
                    FeedView(user: user)
                        .tabItem{
                            Label("Home", systemImage: "house")
                        }
                        .navigationBarHidden(true)
                        
                    SearchView()
                        .tabItem{
                                Text("Search")
                                Image(systemName: "magnifyingglass")

                        }
                        .navigationBarHidden(true)
                   
//                    NotificationsView()
//                        .tabItem{
//                            Text("Notifications")
//                            Image(systemName: "bell")
//                        }
//                        .navigationBarHidden(true)
//                    
//                    MessagesView()
//                        .tabItem{
//                            Text("Messages")
//                            Image(systemName: "envelope")
//                        }
//                        .navigationBarHidden(true)
                    
                    UserProfileView(user: user)
                        .tabItem{
                            Text("My Profile")
                            Image(systemName: "person")
                        }
                        .navigationBarHidden(true)
                    
                }
                .ignoresSafeArea()
                
                
                VStack{
                    
                    Spacer()
                    
                    HStack{
                        
                        Spacer()
                        
                        Button(action: {
                            self.showCreatePost.toggle()
                        }, label: {
                            Image(systemName: "rectangle.and.pencil.and.ellipsis.rtl")
                                .renderingMode(.template)
                                .resizable()
                                .frame(width: 25 , height: 25, alignment: .center)
                                .padding()
                                .background(Color.HW)
                                .foregroundColor(.white)
                                .clipShape(Circle())
                        })
                    }
                    .padding()
                }
                .padding(.bottom, 65)
                
            }
            .sheet(isPresented: $showCreatePost, content: {
                CreatePostView(show: self.$showCreatePost, text: text)
            })
        }
        
        .contentShape(Rectangle())
        .background(Color.white)
    }
}

//struct Home_Previews: PreviewProvider {
//    static var previews: some View {
//        Home()
//    }
//}
