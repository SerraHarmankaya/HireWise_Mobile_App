//
//  UserModel.swift
//  HireWise_App
//
//  Created by Serra Harmankaya on 27.12.2024.
//

import Foundation

struct ApiResponse: Decodable {
    var user: User
    var token: String
}

struct User: Decodable, Identifiable {
    var _id: String
    var name: String
    let username: String
    let email: String
    var id: String {
        return _id
    }
    var location: String?
    var bio: String?
    var website: String?
    var avatarExists: Bool?
    var followers: [String]
    var following: [String]
    var isCurrentUser: Bool? = false
    var isFollowed: Bool? = false
    
}
