//
//  ProfileViewModel.swift
//  HireWise_App
//
//  Created by Serra Harmankaya on 5.01.2025.
//

import SwiftUI

class ProfileViewModel: ObservableObject {
    
    @Published var user: User
    
    init(user: User) {
        self.user = user
    }
    
}
