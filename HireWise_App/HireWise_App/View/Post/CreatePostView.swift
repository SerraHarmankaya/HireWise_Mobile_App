//
//  CreatePostView.swift
//  HireWise_App
//
//  Created by Serra Harmankaya on 18.10.2024.
//

import SwiftUI

struct CreatePostView: View {
    
    @Binding var show: Bool
    @State var text = ""
    
    @State var imagePickerPresented = false
    @State var selectedImage: UIImage?
    @State var postImage: Image?
    
    
    @ObservedObject var viewModel = CreatePostViewModel()
    
    var body: some View {
      
        
        VStack{
            HStack{
                Button(action: {
                    
                    self.show.toggle()
                    
                }, label: {
                    Text("Cancel")
                        
                        
                })
                .foregroundStyle(Color.HW)
                
                Spacer()
                
                Button(action: {
                    
                    if text != ""{
                        self.viewModel.uploadPost(text: text, image: selectedImage)
                    }
                    
                    self.show.toggle()
                    
                }, label: {
                    Text("Post").padding()
                        
                })
                .background(Color.HW)
                .foregroundStyle(Color.white)
                .clipShape(Capsule())
            }
            
            TextField("Share your Interview Experience", text: $text, axis: .vertical)
                .border(.clear)
                .textFieldStyle(.roundedBorder)
                .padding()
            Spacer()
                
            if postImage == nil {
                Button {
                    self.imagePickerPresented.toggle()
                } label: {
                    Spacer()
                    Image(systemName: "paperclip")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 35, height: 35)
                        .clipped()
                        .foregroundStyle(Color.HW)
                        .padding(.top)
                }.sheet(isPresented: $imagePickerPresented) {
                    loadImage()
                } content: {
                    ImagePicker(image: $selectedImage)
                }

            }
           
            else if let image = postImage {
                VStack {
                    
                    HStack(alignment: .top) {
                        image
                            .resizable()
                            .scaledToFit()
                            .padding(.horizontal)
                            .frame(width: UIScreen.main.bounds.width * 0.9)
                            .cornerRadius(16)
                            .clipped()
                            
                    }
                    Spacer()
                }
            }
                
            
        }
        .padding()
    }
}

extension CreatePostView {
    func loadImage() {
        
        guard let selectedImage else { return }
        postImage = Image(uiImage: selectedImage)
    }
}

//#Preview {
//    CreatePostView()
//}
