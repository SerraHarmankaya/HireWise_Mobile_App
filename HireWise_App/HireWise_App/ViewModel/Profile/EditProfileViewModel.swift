//
//  EditProfileViewModel.swift
//  HireWise_App
//
//  Created by Serra Harmankaya on 15.01.2025.
//

import SwiftUI

class EditProfileViewModel: ObservableObject {
    
    @Published var user: User
    @Published var uploadComplete = false
    
    init(user: User) {
        self.user = user
    }
    
    func saveChanges(name: String?, bio: String?, website: String?) {
        guard let userNewName = name else { return }
        guard let userNewBio = bio else { return }
        guard let userNewWebsite = website else { return }
        
        self.user.name = userNewName
        self.user.bio = userNewBio
        self.user.website = userNewWebsite
        self.uploadComplete.toggle()
    }
    
    func uploadUserData(name: String?, bio: String?, website: String?) {
        
    }
}

