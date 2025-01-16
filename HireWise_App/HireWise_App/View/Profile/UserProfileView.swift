//
//  UserProfileView.swift
//  HireWise_App
//
//  Created by Serra Harmankaya on 13.11.2024.
//

import SwiftUI

struct UserProfileView: View {
    
    @ObservedObject var viewModel: ProfileViewModel
    
    @State var editProfileShow = false
    
    let user: User
    
    @State var offset: CGFloat = 0
    
    @State var titleOffset: CGFloat = 0
    
    init(user: User) {
        self.user = user
        self.viewModel = ProfileViewModel(user: user)
    }
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
           
            VStack {
                HStack {
                    
                    Image("Profile")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 75, height: 75)
                        .clipShape(Circle())
                        .padding(8)
                        .background(Color.white.clipShape(Circle()))
                        .offset(y: offset < 0 ? getOffset() - 20 : -20)
                        .scaleEffect(getScale())
                    
                    Spacer()
                    
                    Button(action: {
                        self.editProfileShow.toggle()
                    }, label: {
                        Text("Edit Profile")
                            .foregroundColor(.HW)
                            .padding(.vertical, 10)
                            .padding(.horizontal)
                            .background(Capsule().stroke(Color.HW, lineWidth: 1.5))
                    })
                    .sheet(isPresented: $editProfileShow) {
                        
                    } content: {
                        EditProfileView(user: $viewModel.user)
                    }

                }
                .padding(.top, 20)
                .padding(.bottom, -1)
                
                
                VStack(alignment: .leading, spacing: 8, content: {
                    Text(self.user.username)
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                    
                    Text("@\(self.user.username)")
                        .foregroundColor(.gray)
                    
                    Text("I do what i like!!")
                    
                    HStack(spacing: 5, content: {
                        Text("1")
                            .foregroundColor(.primary)
                            .fontWeight(.semibold)
                        
                        Text("Followers")
                            .foregroundColor(.gray)
                        
                        Text("0")
                            .foregroundColor(.primary)
                            .fontWeight(.semibold)
                            .padding(.leading, 10)
                        
                        Text("Followings")
                            .foregroundColor(.gray)
                        
                    })
    
                    
                })
                .padding(.trailing, 140)
                
                
                
                Divider()
                
                .overlay(
                    
                    GeometryReader { proxy -> Color in
                    
                        let minY = proxy.frame(in: .global).minY
                        
                        DispatchQueue.main.async {
                            self.titleOffset = minY
                        }
                        
                        return Color.clear
                    }
                    .frame(width: 0, height: 0, alignment: .top)
                 
                    
                )
                
                VStack(spacing: 18, content: {
                    
//                        PostCellView(post: "The intervied held with Apple did not go how i imagined :(", postImage: "photo2")
//
//                        Divider()
//
//                        ForEach(0..<20, id: \.self) { _ in
//
//                            PostCellView(post: "The intervied held with Apple did not go how i imagined :(")
//                            Divider()
//                        }
                })
                .padding(.top)
                .zIndex(0)
            }
                            
            .padding(.horizontal)
            .zIndex(-offset > 80 ? 0 : 1)
            
            VStack(spacing: 15) {
                
                GeometryReader { proxy -> AnyView in
                    
                    let minY = proxy.frame(in: .global).minY

                    DispatchQueue.main.async {
                        self.offset = minY
                    }
                    
                    
                    return AnyView(
                        
                        ZStack {
                            
//                            Image("pc")
//                                .resizable()
//                                .aspectRatio(contentMode: .fill)
//                                .frame(width: getRect().width, height: minY > 0 ? 180 + minY  : 180 , alignment: .center)
//                                .cornerRadius(0)
//                            
//                            BlurView()
//                                .opacity(blurViewOpacity())
//
                            VStack(spacing: 5){
                                Text(viewModel.user.name)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                
                                Text("Computer Engineering Student")
                                    .foregroundColor(.white)
                            }
                            .offset(y: 120)
                            .offset(y: titleOffset > 100 ? 0 : -getTitleOffset())
                            .opacity(titleOffset < 100 ? 1 : 0)
                        }
                        .clipped()
                        .frame(height: minY > 0 ? 180 + minY : nil)
                        .offset(y: minY > 0 ? -minY : -minY < 80 ? 0 : -minY - 80)
                    )
                }
                .frame(height: 180)
                .zIndex(1)
                
                // Profile Image
                
                
            }
        }
        .ignoresSafeArea(.all, edges: .top)
    }
    
    func blurViewOpacity() -> Double {
        let progress = -(offset + 80) / 150
        
        return Double(-offset > 80 ? progress : 0)
    }
    
    func getTitleOffset() -> CGFloat {
        let progress = 20 / titleOffset
        let offset = 60 * (progress > 0 && progress <= 1 ? progress : 1)
        return offset
    }
    
    func getOffset() -> CGFloat {
        let progress = (-offset / 80) * 20
        return progress <= 20 ? progress : 20
    }
    
    func getScale() -> CGFloat {
        let progress = -offset / 80
        let scale = 1.9 - (progress < 1.0 ? progress : 1)
        return scale < 1 ? scale : 1
    }
}
//
//#Preview {
//    UserProfileView()
//}
