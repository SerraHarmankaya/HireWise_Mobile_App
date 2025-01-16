//
//  CustomProfileTextView.swift
//  HireWise_App
//
//  Created by Serra Harmankaya on 12.01.2025.
//

import SwiftUI

struct CustomProfileTextView: View {
    
    @Binding var text: String
    var placeholder: String
    
    var body: some View {
        HStack {
            ZStack {
                HStack {
                    if text.isEmpty {
                        Text(placeholder)
                            .foregroundStyle(.gray)
                    }
                    Spacer()
                        
                }
                TextField("", text: $text)
                    .foregroundStyle(.HW)
            }
        }
    }
}

//#Preview {
//    CustomProfileTextView()
//}
