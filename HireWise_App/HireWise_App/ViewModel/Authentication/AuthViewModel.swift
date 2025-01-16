//
//  AuthViewModel.swift
//  HireWise_App
//
//  Created by Serra Harmankaya on 27.12.2024.
//

import Foundation
import SwiftUI

class AuthViewModel: ObservableObject {

    @Published var isAuthenticated: Bool = false
    @Published var currentUser: User?

    // Kullanıcının daha önce logged in olup olmadığına bakmak için token exits mi onu kontrol ediyoruz.
//    init() {
//        let defaults = UserDefaults.standard
//        let token = defaults.object(forKey: "jsonwebtoken")
//        //defaults.removeObject(forKey: "jsonwebtoken")
//
//        //logout()
//
//        print(token)
//
//        if token != nil {
//            isAuthenticated = true
//
//            if let userId = defaults.object(forKey: "userid") {
//                fetchUser(userId: userId as! String)
//                print("userId")
//
//            }
//        } else {
//            isAuthenticated = false
//        }
//    }

    static let shared = AuthViewModel()

    // LOGIN
    
    func login(email: String, password: String) {

        let defaults = UserDefaults.standard

        AuthServices.requestDomain = "http://localhost:3000/users/login"

        AuthServices.login(email: email, password: password) { result in
            switch result {
            case .success(let data):
                guard
                    let user = try? JSONDecoder().decode(
                        ApiResponse.self, from: data as! Data)
                else {
                    return
                }
                DispatchQueue.main.async {
                    defaults.set(user.token, forKey: "jsonwebtoken")
                    defaults.set(user.user.id, forKey: "userid")
                    self.isAuthenticated = true
                    self.currentUser = user.user
                    print("Giriş Yapıldı")
                }

            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    // REGISTER

    func register(
        name: String, username: String, email: String, password: String
    ) {
        AuthServices.reqister(
            name: name, username: username, email: email, password: password
        ) { result in
            switch result {
            case .success(let data):
                guard
                    let user = try? JSONDecoder().decode(
                        ApiResponse.self, from: data as! Data)
                else {
                    return
                }
                print("Success")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }

    }

    // API'a HTTP GET isteği gönderiyoruz.

    func fetchUser(userId: String) {
        
        print(userId)

        let defaults = UserDefaults.standard

        AuthServices.requestDomain = "http://localhost:3000/users/\(userId)"

        AuthServices.fetchUser(id: userId) { result in
            switch result {
            case .success(let data):
                guard
                    let user = try? JSONDecoder().decode(
                        User.self, from: data as! Data)
                else {
                    return
                }

                DispatchQueue.main.async {
                    defaults.setValue(user.id, forKey: "userid")
                    self.isAuthenticated = true
                    self.currentUser = user
                    print("Success")
                    print(user)
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    // LOGOUT
    
    func logout() {
        let defaults = UserDefaults.standard
        let dictionary = defaults.dictionaryRepresentation()

        dictionary.keys.forEach { key in
            defaults.removeObject(forKey: key)
        }

        DispatchQueue.main.async {
            self.isAuthenticated = false

        }
 
    }
}
