//
//  MainView.swift
//  HireWise_App
//
//  Created by Serra Harmankaya on 25.10.2024.
//

import SwiftUI

struct MainView: View {
    
    let user: User
    
    @State var width = UIScreen.main.bounds.width - 90
    
    @State var x = -UIScreen.main.bounds.width + 90
    
    var body: some View {
       
        NavigationStack{
            VStack {
                ZStack(alignment: Alignment(horizontal: .leading, vertical: .center), content: {
                    VStack {
                        TopBarView(x: $x)
                        Home(x: $x, user: user)
                    }
                    .offset(x: x + width)
                    
                    SlideMenu(viewModel: AuthViewModel.shared)
                        .shadow(color: Color.black.opacity(x != 0 ? 0.1: 0),radius: 5, x: 5, y: 0)
                        .offset(x: x)
                        .background(Color.black.opacity(x == 0 ? 0.4 : 0))
                        .ignoresSafeArea(.all, edges: .vertical)
                        .onTapGesture {
                            withAnimation{
                                x = -width
                            }
                        }
                })
                .gesture(DragGesture().onChanged({ (value) in
                    withAnimation{
                        
                        if value.translation.width > 0 {
                            if x < 0 {
                                
                                x = -width + value.translation.width
                            }
                        }
                        else {
                            if x != -width {
                                x = value.translation.width
                            }
                        }
                    }
                    
                }).onEnded({ (value) in
                    withAnimation{
                        if -x < width / 1.5 {
                            x = 0
                        }
                        else {
                            x = -width
                        }
                    }
                }))
                
            }
            .navigationBarHidden(true)
            .navigationBarTitle("")
        }
        
    }
}

/*#Preview {
    MainView()
}*/
