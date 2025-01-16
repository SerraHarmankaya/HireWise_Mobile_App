//
//  ProfileView.swift
//  HireWise_App
//
//  Created by Serra Harmankaya on 15.10.2024.
//



// Not using in the curent project

import SwiftUI

struct ProfileView: View {
    
    @ObservedObject var viewModel : AuthViewModel
    
    var body: some View {
        
        VStack {
            
            HStack(alignment: .top) {
                
                VStack(alignment: .leading, spacing: 5, content: {
                    Image("photo1")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 70, height: 70)
                        .clipShape(Circle())
                    
                    
                })
                
                Text("Serra")
                    .fontWeight(.bold)
                    
                
                
                Spacer(minLength: 0)
            }
            .padding(.leading, 30)
        }
        Spacer()
    }
}

//#Preview {
//    ProfileView()
//}
