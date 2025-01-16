//
//  WelcomeView.swift
//  HireWise_App
//
//  Created by Serra Harmankaya on 14.11.2024.
//

import SwiftUI

struct WelcomeView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    @State var width = UIScreen.main.bounds.width
    
    var body: some View {
        
        NavigationStack{
            VStack {
                HStack {
                    
                    Spacer(minLength: 0)
                    
                    Image("HW_logo")
                        .resizable()
                        .scaledToFill()
                        .padding(.trailing)
                        .frame(width: 25, height: 25)
                        
                    Spacer(minLength: 0)
                }
                
                Spacer(minLength: 0)
                
                Text("Ready to take the next step in your career journey? Share experiences, gain insights, and get interview-ready with confidence!")
                    .font(.system(size: 30, weight: .bold, design: .default))
                    .frame(width: (getRect().width * 0.9), alignment: .center)
                
                Spacer(minLength: 0)
                
                VStack(alignment: .center,spacing: 10, content: {
                    
                    Button(action: {
                        print("Sign in with Google")
                    }, label: {
                        HStack(spacing: -4, content: {
                            
                            Image("google")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25, height: 25)
                            
                            Text("Continue with Google")
                                .fontWeight(.semibold)
                                .font(.title3)
                                .foregroundStyle(.black)
                                .padding()
                                
                        })
                        .overlay(
                            RoundedRectangle(cornerRadius: 36)
                                .stroke(Color.black, lineWidth: 1)
                                .opacity(0.3)
                                .frame(width: 320, height: 60,alignment: .center)
                        )
                    })
                    
//                    Button(action: {
//                        print("Sign in with Apple")
//                    }, label: {
//                        HStack(spacing: -4, content: {
//                            
//                            Image("apple")
//                                .resizable()
//                                .scaledToFit()
//                                .frame(width: 25, height: 25)
//                            
//                            Text("Continue with Apple")
//                                .fontWeight(.semibold)
//                                .font(.title3)
//                                .foregroundStyle(.black)
//                                .padding()
//                                
//                        })
//                        
//                        
//                        .overlay(
//                            RoundedRectangle(cornerRadius: 36)
//                                .stroke(Color.black, lineWidth: 1)
//                                .opacity(0.3)
//                                .frame(width: 320, height: 60,alignment: .center)
//                        )
//                    })
//                    
                    HStack {
                        Rectangle()
                            .foregroundStyle(.gray)
                            .opacity(0.3)
                            .frame(width: getRect().width * 0.35, height: 1)
                        
                        Text("Or")
                            .foregroundStyle(.gray)
                        
                        Rectangle()
                            .foregroundStyle(.gray)
                            .opacity(0.3)
                            .frame(width: getRect().width * 0.35, height: 1)
                    }
                    
                    NavigationLink(destination: RegisterView().navigationBarHidden(true)) {
                        RoundedRectangle(cornerRadius: 36)
                            .foregroundStyle(Color.HW)
                            .frame(width: 320, height: 60, alignment: .center)
                            .overlay(
                                Text("Create account")
                                    .fontWeight(.semibold)
                                    .font(.title3)
                                    .foregroundStyle(.white)
                                    .padding()
                            )
                    }
                })
                .padding()
                
                VStack(alignment: .leading, content: {
                    VStack {
                        Text("By signing up, you agree to our ")
                        + Text("Terms").foregroundStyle(Color.HW)
                        + Text(",")
                        + Text(" Privacy Policy").foregroundStyle(.HW)
                        + Text(", ")
                        + Text(" Cookie Use.").foregroundStyle(.HW)
                    }
                    .padding(.bottom)
                    
                    HStack(spacing: 2) {
                        Text("Have an account already? ")
                        
                        NavigationLink(destination: LogInView().navigationBarHidden(true)) {
                            Text("Log in.").foregroundStyle(Color.HW)
                        }
                    }
                    
                })
                
                
            }
            .navigationBarHidden(true)
            .navigationBarTitle("")
        }
    }
}

#Preview {
    WelcomeView()
}
