//
//  CustomAuthTExtField.swift
//  HireWise_App
//
//  Created by Serra Harmankaya on 14.11.2024.
//

import SwiftUI

struct CustomAuthTextField: View {
    
    var placeholder: String
    @Binding var text: String
    
    var body: some View {
        
        VStack {
            ZStack(alignment: .leading, content: {
                
                if text.isEmpty {
                    Text(placeholder)
                        .foregroundStyle(.gray)
                }
                
                
                TextField("", text: $text)
                    .frame(height: 45)
                    .foregroundStyle(Color.HW)
                
            })
        
            Rectangle()
                .frame(height: 1, alignment: .center)
                .foregroundStyle(.gray)
                .padding(.top, -2)
        }
        .padding(.horizontal)
    }
}

/*#Preview {
    CustomAuthTextField()
}
*/
