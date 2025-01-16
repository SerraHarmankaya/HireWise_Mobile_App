//
//  SearchUserCellView.swift
//  HireWise_App
//
//  Created by Serra Harmankaya on 20.10.2024.
//

import SwiftUI
import Kingfisher

struct SearchUserCell: View {
    
    let user: User
    
    var body: some View {
        HStack {
            
            if let avatarExists = user.avatarExists, avatarExists == true {
                KFImage(URL(string: "http://localhost:3000/users/\(self.user.id)/avatar"))
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
            
            
           
            VStack(alignment: .leading) {
                Text(user.name)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                Text(user.username)
                    .foregroundColor(.black)
                
            }
            
            Spacer(minLength: 0)
        }
    }
}


