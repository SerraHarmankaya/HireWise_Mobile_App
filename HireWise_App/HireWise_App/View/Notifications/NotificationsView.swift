//
//  NotificationsView.swift
//  HireWise_App
//
//  Created by Serra Harmankaya on 15.10.2024.
//

import SwiftUI

struct NotificationsView: View {
    var body: some View {
        
        VStack {
            ScrollView {
                
                ForEach(0..<7) { _ in
                    NotificationCellView()
                }
            }
        }
        
    }
}

#Preview {
    NotificationsView()
}
