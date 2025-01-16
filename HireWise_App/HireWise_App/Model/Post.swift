//
//  PostModel.swift
//  HireWise_App
//
//  Created by Serra Harmankaya on 1.01.2025.
//

//import Foundation
import SwiftUI

// Identifiable demek her oluşturulacak post'un kendi id'si olucak ayrı değerlendirilcek.
// Decodable postları serverdan fetch ettiğimizde onları Json decoder ile decode etmemize yarıyacak.

struct Post: Identifiable, Decodable {
    let _id: String
    var id: String {
        return _id
    }
    let text: String
    let userId: String
    let username: String
    let user: String
    var likes: [String]
    var didlike: Bool? = false
    //let image: String?
}
