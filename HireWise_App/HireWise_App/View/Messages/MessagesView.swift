//
//  MessagesView.swift
//  HireWise_App
//
//  Created by Serra Harmankaya on 15.10.2024.
//

import SwiftUI

struct MessagesView: View {
    var body: some View {
        
        VStack {
            ScrollView {
                ForEach(0..<10) { _ in
                    MessageCellView()
                }
            }
        }
    }
}

#Preview {
    MessagesView()
}
