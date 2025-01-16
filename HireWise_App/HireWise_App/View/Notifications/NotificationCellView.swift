//
//  NotificationCellView.swift
//  HireWise_App
//
//  Created by Serra Harmankaya on 21.10.2024.
//

import SwiftUI

struct NotificationCellView: View {
    
    @State var width = UIScreen.main.bounds.width
    
    var body: some View {
        VStack {
            Rectangle()
                .frame(width: width, height: 1,alignment: .center)
                .foregroundColor(.gray)
                .opacity(0.3)
            
            HStack(alignment: .top) {
                
                Image(systemName: "person.fill")
                    .resizable()
                    .foregroundColor(Color.HW)
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                
                VStack(alignment: .leading, spacing: 5, content: {
                    Image("photo1")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                    
                    Text("Serra ")
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                    
                    +
                    
                    Text("followed you")
                        .foregroundColor(.black)
                })
                
                Spacer(minLength: 0)
                
            }
            .padding(.leading, 30)
        }
    }
}

#Preview {
    NotificationCellView()
}
