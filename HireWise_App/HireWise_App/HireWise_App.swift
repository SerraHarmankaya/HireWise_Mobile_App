//
//  HireWise_AppApp.swift
//  HireWise_App
//
//  Created by Serra Harmankaya on 14.10.2024.
//

import SwiftUI

@main
struct HireWise_App: App {
    
    init(){
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().shadowImage = UIImage()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(AuthViewModel.shared)
        }
    }
}
