//
//  RequestServices.swift
//  HireWise_App
//
//  Created by Serra Harmankaya on 2.01.2025.
//

import Foundation

public class RequestServices {
    public static var requestDomain = ""
    
    public static func postExperience(text: String, user: String, username: String, userId: String, completion: @escaping ( _ result: [String : Any]?) -> Void ) {
        
        let params = ["text": text, "user": user, "username": username, "userId" : userId] as [String : Any]
        
        let url = URL(string: requestDomain)!
        
        let session = URLSession.shared
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)
        }
        catch let error {
            print(error)
        }
        
        // Authentication Part in the HTTP Request
        
        let token = UserDefaults.standard.string(forKey: "jsonwebtoken")!
        
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let task = session.dataTask(with: request) { data, res, error in
            guard error == nil else {
                return
            }
            guard let data = data else { return }
            
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String : Any] {
                    completion(json)
                }
            }
            catch let error {
                print(error)
            }
        }
        task.resume()
    }
    
    
    static func fetchFeed(completion: @escaping (_ result: Result<Data?, NetworkError>) -> Void) {
        
        let url = URL(string: requestDomain)
        
        let session = URLSession.shared
        
        var request = URLRequest(url: url!)
        
        request.httpMethod = "GET"
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let task = session.dataTask(with: request) { data, response, error in
            
            guard error == nil else {
                completion(.failure(.noData))
                return
            }
            
            guard let data = data else {
                return
            }
            
            completion(.success(data))
        }
        
        task.resume()
        
    }
    
    public static func likePost(id: String, completion: @escaping (_ result: [String: Any]?) -> Void) {
        
        let params = ["id" : id] as [String : Any]
        
        let url = URL(string: requestDomain)!
        
        let session = URLSession.shared
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "PUT"
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)
        }
        catch let error {
            print(error)
        }
        

        let token = UserDefaults.standard.string(forKey: "jsonwebtoken")!
        
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let task = session.dataTask(with: request) { data, response, error in
            guard error == nil else {
                return
            }
            
            guard let data else { return }
            
            
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                    //print("response: \(json)")
                    completion(json)
                }
            }
            catch let error {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    public static func unlikePost(id: String, completion: @escaping (_ result: [String: Any]?) -> Void) {
        
        let params = ["id" : id] as [String : Any]
        
        let url = URL(string: requestDomain)!
        
        let session = URLSession.shared
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "PUT"
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)
        }
        catch let error {
            print(error)
        }
        

        let token = UserDefaults.standard.string(forKey: "jsonwebtoken")!
        
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let task = session.dataTask(with: request) { data, response, error in
            guard error == nil else {
                return
            }
            
            guard let data else { return }
            
            
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                    completion(json)
                }
            }
            catch let error {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}
