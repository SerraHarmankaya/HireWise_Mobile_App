//
//  LogInView.swift
//  HireWise_App
//
//  Created by Serra Harmankaya on 15.11.2024.
//

import SwiftUI

struct LogInView: View {
    
    @State var email = ""
    @State var password = ""
    @State var emailDone = false
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        if !emailDone{
            VStack {
                VStack {
                    ZStack{
                        
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
                    
                    Text("To get started enter your email")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                        .padding(.top)
                    
                    CustomAuthTextField(placeholder: "Email", text: $email)
                }
                
                Spacer(minLength: 0)
                
                VStack {
                    Button(action: {
                        if !email.isEmpty{
                            self.emailDone.toggle()
                        }
                        
                    }, label: {
                        Capsule()
                            .frame(width: 360, height: 40, alignment: .center)
                            .foregroundStyle(.HW)
                            .overlay(Text("Next").foregroundStyle(.white))
                    })
                    .padding(.bottom, 4)
                    
                    Text("Forgot Password?")
                        .foregroundStyle(.HW)
                }
            }
        }
        else {
            VStack {
                VStack {
                    ZStack{
                        
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
                    
                    Text("Enter your password")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                        .padding(.top)
                    
                    SecureAuthTextField(placeholder: "Password", text: $password)
                }
                
                Spacer(minLength: 0)
                
                VStack {
                    Button(action: {
                        self.viewModel.login(email: email, password: password)
                    }, label: {
                        Capsule()
                            .frame(width: 360, height: 40, alignment: .center)
                            .foregroundStyle(.HW)
                            .overlay(Text("Log in").foregroundStyle(.white))
                    }) 
                    .padding(.bottom, 4)
                    
                    Text("Forgot Password?")
                        .foregroundStyle(.HW)
                }
            }
        }
    }
}

#Preview {
    LogInView()
}
