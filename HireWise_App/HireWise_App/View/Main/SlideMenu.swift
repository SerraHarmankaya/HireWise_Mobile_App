//
//  SlideMenu.swift
//  HireWise_App
//
//  Created by Serra Harmankaya on 25.10.2024.
//

import SwiftUI


struct SlideMenu: View {
    
    @ObservedObject var viewModel : AuthViewModel
    
    //@State var width = UIScreen.main.bounds.width
    
    @State var show = false
    
    var menuButtons = ["Profile"]
    
    var edges = UIApplication.shared.windows.first?.safeAreaInsets
   
    @State var width = UIScreen.main.bounds.width
   
    
    var body: some View {
        VStack {
            HStack(spacing: 0, content: {
                
                
                VStack(alignment: .leading, content: {
                    
                    NavigationLink(destination: UserProfileView(user: viewModel.currentUser!)) {
                        Image("photo1")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 60, height: 60)
                            .clipShape(Circle())
                    }
                    
                    
                    HStack(alignment: .top, spacing: 12, content: {
                        
                        VStack(alignment: .leading, spacing:12 , content: {
                            
                            NavigationLink(destination: UserProfileView(user: viewModel.currentUser!)){
                                Text(viewModel.currentUser!.name)
                                    .font(.title3)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                
                                Text("@\(viewModel.currentUser!.username)")
                                    .foregroundColor(.gray)
                            }
                            
                            
                            HStack(spacing: 20){
                                
                                FollowView(count: viewModel.currentUser!.following.count, title: "Following")
                                FollowView(count: viewModel.currentUser!.followers.count, title: "Followers")
                                    
                            }
                            .padding(.top, 10)
                                
                            /*Rectangle()
                                .frame(width: width, height: 1)
                                .foregroundColor(.gray)
                                .opacity(0.3)*/
                            Divider()
                                .padding(.top, 10)
                        })
                        
                        Spacer(minLength: 0)
                        
                        Button(action: {
                            withAnimation{
                                self.show.toggle()
                            }
                        }, label: {
                            Image(systemName: show ? "chevron.down" : "chevron.up")
                                .foregroundColor(Color.HW)
                        })
                    })
                    
                    VStack(alignment: .leading, content: {
                        
                        ForEach(menuButtons, id:\.self){ item in
                            
                            NavigationLink(destination: UserProfileView(user: viewModel.currentUser!)) {
                                MenuButton(title: item)
                            }
                        }
                        
                       
                        Spacer(minLength: 0)
                        
                        Divider()
                            .padding(.bottom)
                        
                        Button(action: {
                            AuthViewModel.shared.logout()
                        }, label: {
                            Image(systemName: "gearshape")
                                .resizable()
                                .frame(width: 18, height: 18)
                                .foregroundColor(Color.HW)
                               
                            
                            Text("Log Out")
                                .foregroundColor(Color.HW)
                                
                                
                        })
                        .padding(.top, 10)
                        
                        
                    })
                    .opacity(show ? 1 : 0)
                    .frame(height: show ? nil : 0)

                    
                    VStack(alignment: .leading, content: {
                        
                        NavigationLink(destination: RegisterView().navigationBarHidden(true)) {
                            Text("Create a new account")
                                .foregroundColor(Color.HW)
                        }
                        
                        
                        Spacer(minLength: 0)
                    })
                    .opacity(show ? 0 : 1)
                    .frame(height: show ? 0 : nil)
                    
                })
                .padding(.horizontal, 20)
                .padding(.top, edges!.top == 0 ? 15 : edges?.top)
                .padding(.bottom, edges!.bottom == 0 ? 15 : edges?.bottom)
                .frame(width: width - 90)
                .background(Color.white)
                .ignoresSafeArea(.all, edges: .vertical)
                
                Spacer(minLength: 0)
                    
            })
        }
    }
}

//#Preview {
//    SlideMenu()
//}
