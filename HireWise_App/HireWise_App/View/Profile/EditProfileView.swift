//
//  EditProfileView.swift
//  HireWise_App
//
//  Created by Serra Harmankaya on 5.01.2025.
//

import SwiftUI
import Kingfisher

struct EditProfileView: View {
    
    @State var profileImage: Image?
    @State private var selectedImage: UIImage?
    
    @ObservedObject var viewModel: EditProfileViewModel
    @Binding var user: User
    
    @State var imagePicker = false
    
    @State var name: String
    
    @State var bio: String
    
    @State var website: String
    
    @Environment(\.dismiss) var dismiss
    
    init(user: Binding<User>){
        self._user = user
        self.viewModel = EditProfileViewModel(user: self._user.wrappedValue)
        self._name = State(initialValue: _user.name.wrappedValue ?? "")
        self._bio = State(initialValue: _user.bio.wrappedValue ?? "")
        self._website = State(initialValue: _user.website.wrappedValue ?? "")
    }
    
    var body: some View {
        
        VStack {
            ZStack {
                HStack {
                    Button {
                        self.dismiss()
                    } label: {
                        Text("Cancel")
                            .foregroundColor(Color.HW)
                    }
                    
                    Spacer()
                    
                    Button {
                        self.viewModel.saveChanges(name: name, bio: bio, website: website)
                    } label: {
                        Text("Save")
                            .foregroundColor(Color.HW)
                    }
                }
                .padding()
                
                HStack {
                    Spacer()
                    Text("Edit Profile")
                        .fontWeight(.semibold)
                    Spacer()
                    
                }
            }
            
            
            VStack {
//                Image("HW_logo")
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
//                    .frame(width: getRect().width, height: 180, alignment: .center)
//                    .cornerRadius(0)
//                
                
                HStack {
                    if profileImage == nil {
                        Button {
                            self.imagePicker.toggle()
                        } label: {
                            KFImage(URL(string: "http://localhost:3000/users/id/avatar"))
                                .resizable()
                                .placeholder{
                                    Image("Profile")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 75, height: 75)
                                        .clipShape(Circle())
                                }
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 75, height: 75)
                                .clipShape(Circle())
                                .padding(8)
                                .background(Color.white)
                                .clipShape(Circle())
                                .offset(y: -20)
                                .padding(.leading, 12)
                        }
                        .sheet(isPresented: $imagePicker) {
                            loadImage()
                        } content: {
                            ImagePicker(image: $selectedImage)
                        }
                    }
                    
                    else if let image = profileImage {
                        VStack {
                            HStack(alignment: .top) {
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 75, height: 75)
                                    .clipShape(Circle())
                                    .padding(8)
                                    .background(Color.white)
                                    .clipShape(Circle())
                                    .offset(y: -20)
                            }
                            .padding()
                        }
                        .padding(.leading, 12)
                    }
                    Spacer()
                }
                .onAppear{
                    KingfisherManager.shared.cache.clearCache()
                }
                .padding(.top, 10)
                .padding(.bottom, -10)
                
                VStack {
                    Divider()
                    HStack {
                        ZStack {
                            HStack {
                                Text("Name")
                                    .foregroundStyle(.HW)
                                    .fontWeight(.semibold)
                                Spacer()
                            }
                            CustomProfileTextView(text: $name, placeholder: "Type name")
                                .padding(.leading, 90)
                        }
                    }
                    .padding(.horizontal)
                    
                    Divider()
                    HStack {
                        ZStack(alignment: .topLeading) {
                            HStack {
                                Text("Bio")
                                    .foregroundStyle(.HW)
                                    .fontWeight(.semibold)
                                Spacer()
                            }
                            CustomProfileBioView(bio: $bio)
                                .padding(.leading, 86)
                                .padding(.top, -6)
                        }
                    }
                    .padding(.horizontal)
                    
                    
                    
                    Divider()
                    HStack {
                        ZStack {
                            HStack {
                                Text("Website")
                                    .foregroundStyle(.HW)
                                    .fontWeight(.semibold)
                                Spacer()
                            }
                            CustomProfileTextView(text: $website, placeholder: "Add your website")
                                .padding(.leading, 90)
                        }
                    }
                    .padding(.horizontal)
                }
            }
            Spacer()
        }
        .onReceive(viewModel.$uploadComplete) { completed in
            if completed {
                self.dismiss()
                
                self.user.name = viewModel.user.name
                self.user.bio = viewModel.user.bio
                self.user.website = viewModel.user.website
            }
        }
    }
}

//#Preview {
//    EditProfileView()
//}

extension EditProfileView {
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        profileImage = Image(uiImage: selectedImage)
    }
}
