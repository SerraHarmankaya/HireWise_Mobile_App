//
//  CustomProfileBioView.swift
//  HireWise_App
//
//  Created by Serra Harmankaya on 12.01.2025.
//

import SwiftUI

struct CustomProfileBioView: View {
    
    @Binding var bio: String
    
    var body: some View {
        VStack {
            ZStack(alignment: .top) {
                if bio.isEmpty {
                    HStack {
                        Text("Introduce yourself")
                            .foregroundStyle(.gray)
                        Spacer()
                            
                    }
                    .padding(.top,8)
                    .padding(.leading, 4)
                    .zIndex(1)
                }
                TextEditor(text: $bio)
                    .foregroundStyle(.HW)
            }
        }
        .frame(height: 90)
    }
}

