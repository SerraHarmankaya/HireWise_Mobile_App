//
//  AuthServices.swift
//  HireWise_App
//
//  Created by Serra Harmankaya on 27.12.2024.
//

import Foundation
import SwiftUI

enum NetworkError: Error {
    case invalidURL
    case decodingError
    case noData
}

enum AuthenticationError: Error {
    case invalidCredentials
    case custom(errorMessage: String)
    //    case invalidName
    //    case invalidPassword
    //    case invalidEmail
    //    case invalidUsername
    //    case invalidData
}

public class AuthServices {

    public static var requestDomain = ""

    static func login(email: String, password: String, completion: @escaping (_ result: Result<Data?, AuthenticationError>) -> Void) {
        
            let urlString = URL(string: "http://localhost:3000/users/login")!

        makeRequest(
            urlString: urlString,
            reqBody: ["email": email, "password": password]
        ) { result in
            switch result {
                case .success(let data):
                    completion(.success(data))
                case .failure(let error):
                    completion(.failure(.invalidCredentials))
            }
        }
    }

    static func reqister(
        name: String, username: String, email: String, password: String,
        completion: @escaping (_ result: Result<Data?, AuthenticationError>) ->
            Void
    ) {
        let urlString = URL(string: "http://localhost:3000/users")!

        makeRequest(
            urlString: urlString,
            reqBody: [
                "name": name, "username": username, "email": email,
                "password": password,
            ]
        ) { result in
            switch result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(.invalidCredentials))
            }
        }
    }

    
    static func makeRequest(
        urlString: URL, reqBody: [String: Any],
        completion: @escaping (_ result: Result<Data?, NetworkError>) -> Void
    ) {

        let session = URLSession.shared

        var request = URLRequest(url: urlString)  // instead of localhost/3000... we are using the url from the parameteres to make it dynamic

        request.httpMethod = "POST"

        do {
            request.httpBody = try JSONSerialization.data(
                withJSONObject: reqBody, options: .prettyPrinted)
        } catch let error {
            print(error)
        }

        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")

        /*let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
            if let httpResponse = response as? HTTPURLResponse {
                print("Request Body:", reqBody)

                print("Status Code: \(httpResponse.statusCode)")
            }
        }
        task.resume()*/

        let task = session.dataTask(with: request) { data, res, err in
            guard err == nil else {
                return
            }
            guard let data = data else {
                completion(.failure(.noData))
                return
            }

            completion(.success(data))

            do {
                if let json = try JSONSerialization.jsonObject(
                    with: data, options: .mutableContainers) as? [String: Any]
                {

                }
            } catch let error {
                completion(.failure(.decodingError))
                print(error)
            }
        }
        task.resume()
    }

    // Fetching user

    static func fetchUser(
        id: String,
        completion: @escaping (_ result: Result<Data?, AuthenticationError>) ->
            Void
    ) {
        let urlString = URL(string: "http://localhost:3000/users/\(id)")!

        var urlRequest = URLRequest(url: urlString)

        let url = URL(string: requestDomain)!

        let session = URLSession.shared

        var request = URLRequest(url: url)

        urlRequest.httpMethod = "GET"

        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")

        let task = session.dataTask(with: urlRequest) { data, res, error in
            guard let error = error else {
                return
            }
            guard let data = data else {
                return completion(.failure(.invalidCredentials))
            }

            completion(.success(data))

            do {
                if let json = try? JSONSerialization.jsonObject(
                    with: data, options: .mutableContainers) as? [String: Any]
                {

                }
            } catch let error {
                completion(.failure(.invalidCredentials))
            }
        }

        task.resume()

    }
    static func fetchUsers(completion: @escaping (_ result: Result<Data?, AuthenticationError>) -> Void) {
        
        let urlString = URL(string: "http://localhost:3000/users")!
        
        let urlRequest = URLRequest(url: urlString)
        
        let url = URL(string: requestDomain)!
        
        let session = URLSession.shared
        
        var request = URLRequest(url: url)
            
        request.httpMethod = "GET"
        
//        do {
//            request.httpBody = try JSONSerialization.data(withJSONObject: reqBody, options: .prettyPrinted)
//        }
//        catch let error {
//            print(error)
//        }
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")

        let task = session.dataTask(with: request) { data, res, err in
            guard err == nil else {
                
                return
                
            }
            
            guard let data = data else {
                completion(.failure(.invalidCredentials))
                return
                
            }
            
            completion(.success(data))
            
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                    
                    
                }
                
            }
            catch let error {
                completion(.failure(.invalidCredentials))
                print(error)
            }
        }
        
        task.resume()
    }
    
    static func makePatchRequestWithAuth(urlString: URLRequest, reqBody: [String : Any]){
        
    }
}
