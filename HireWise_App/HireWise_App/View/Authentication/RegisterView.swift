//
//  RegisterView.swift
//  HireWise_App
//
//  Created by Serra Harmankaya on 14.11.2024.
//

import SwiftUI

struct RegisterView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    @State var name = ""
    @State var email = ""
    @State var password = ""
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        

         
        VStack {
            ZStack (alignment: .center){
                HStack {
                    
                    Button(action: {
                        dismiss()
                    }, label: {
                        Text("Cancel")
                            .foregroundStyle(.HW)
                            .fontWeight(.medium)
                    })
                    
                    Spacer()
                }
                .padding(.horizontal)
                
                Image("HW_logo")
                    .resizable()
                    .scaledToFill()
                    .padding(.trailing)
                    .frame(width: 25, height: 25)
            }
            
            Text("Create your account")
                .font(.title)
                .bold()
                .padding(.top, 35)
            
            VStack(alignment: .leading) {
                CustomAuthTextField(placeholder: "Name", text: $name)
                CustomAuthTextField(placeholder: "Phone number or email", text: $email)
                SecureAuthTextField(placeholder: "Password", text: $password)
                
                
            }
            
            Spacer(minLength: 0)
            
            VStack {
                Rectangle()
                    .frame(height: 1)
                    .foregroundStyle(.gray)
                
                
                HStack {
                    
                    Spacer()
                    
                    Button(action: {
                        self.viewModel.register(name: name, username: name, email: email, password: password)
                    }, label: {
                        Capsule()
                            .frame(width: 65, height: 40, alignment: .center)
                            .foregroundStyle(Color.HW)
                            .overlay(
                                Text("Next")
                                    .foregroundStyle(.white)
                            )
                        
                    })
                }.padding(.trailing, 24)
                
            }
        }
    }
}

#Preview {
    RegisterView()
}
