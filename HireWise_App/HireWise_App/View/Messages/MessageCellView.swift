//
//  MessageCellView.swift
//  HireWise_App
//
//  Created by Serra Harmankaya on 24.10.2024.
//

import SwiftUI

struct MessageCellView: View {
    
    @State var width = UIScreen.main.bounds.width
    
    var body: some View {
        VStack(alignment: .leading,spacing: nil, content: {
            Rectangle()
                .frame(width: width, height: 1, alignment: .center)
                .foregroundColor(.gray)
                .opacity(0.3)
            
            HStack {
                Image("photo1")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                    .padding(.leading)
                
                
                VStack(alignment: .leading,spacing: 0, content: {
                    HStack{
                        Text("Serra ")
                            .fontWeight(.semibold)
                            .foregroundColor(.primary)
                        
                        Text("@serrahkaya")
                            .foregroundColor(.gray)
                        
                        Spacer(minLength: 0)
                        
                        Text("23/10/2024")
                            .foregroundColor(.gray)
                            .padding(.trailing)
                    }
                    
                    Text("You: Hey, What's up? :)")
                        .foregroundColor(.gray)
                    
                    Spacer()
                })
                    
                }
            .padding(.top, 2)
            
        })
        .frame(width: width, height: 84)
    }
}

#Preview {
    MessageCellView()
}
