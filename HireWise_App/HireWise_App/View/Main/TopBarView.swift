//
//  TopBarView.swift
//  HireWise_App
//
//  Created by Serra Harmankaya on 24.10.2024.
//

import SwiftUI

struct TopBarView: View {
    
    @Binding var x: CGFloat
    
    @State var width = UIScreen.main.bounds.width
    
    var body: some View {
        VStack {
            HStack
            {
                Button(action: {
                    withAnimation{
                        x = 0
                    }
                }, label: {
                    Image(systemName: "line.horizontal.3")
                        .font(.system(size:24))
                        .foregroundColor(Color.HW)
                })
                
                Spacer(minLength: 0)
                
                Image("HW_logo")
                    .resizable()
                    .scaledToFit()
                    .padding(.trailing)
                    .frame(width: 50, height: 50)
                
                Spacer(minLength: 0)
            }
            .padding()
            
            Rectangle()
                .frame(width: width, height: 1)
                .foregroundColor(.gray)
                .opacity(0.3)
        }
        .background(Color.white)
    }
}

/*#Preview {
    TopBarView()
}*/
