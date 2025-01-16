//
//  ContentView.swift
//  HireWise_App
//
//  Created by Serra Harmankaya on 14.10.2024.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        
//        WelcomeView()
        
        if viewModel.isAuthenticated {
            if let user = viewModel.currentUser {
                
                MainView(user: user)
            }
            else {
                Text("Kullanıcı bilgileri yükleniyor...")
            }

        }
        else {
            WelcomeView()
        }
      
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
