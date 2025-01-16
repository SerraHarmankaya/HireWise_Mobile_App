//
//  MenuItem.swift
//  HireWise_App
//
//  Created by Serra Harmankaya on 25.10.2024.
//

import SwiftUI

struct MenuButton: View {
    
    var title: String
    
    var body: some View {
        
        HStack(spacing: 15, content: {
            Image(title)
                .resizable()
                .renderingMode(.template)
                .frame(width: 24, height: 24)
                .foregroundColor(.gray)
            
            Text(title)
                .foregroundColor(.black)
            
            Spacer(minLength: 0)
            
        })
        .padding(.vertical, 12)
    }
}

/*#Preview {
    MenuButton()
}*/
