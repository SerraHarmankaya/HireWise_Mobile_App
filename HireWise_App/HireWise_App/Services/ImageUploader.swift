//
//  ImageUploader.swift
//  HireWise_App
//
//  Created by Serra Harmankaya on 7.01.2025.
//

import SwiftUI

struct ImageUploader {
    // CreatePostViewModel'da kullanıcaz
    static func uploadImage(paramName: String, fileName: String, image: UIImage, urlPath: String) {
        
        let url = URL(string: "http://localhost:3000\(urlPath)")
        
        let boundary = UUID().uuidString
        
        let session = URLSession.shared
        
        var urlRequest = URLRequest(url: url!)
        
        urlRequest.httpMethod = "POST"
        
        // Adding Authentication
        
        let token = UserDefaults.standard.string(forKey: "jsonwebtoken")!
        
        print("Bearer \(token)")
        
        urlRequest.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        urlRequest.addValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        
        var data = Data()
        
        data.append("\r\n--\(boundary)\r\n".data(using: .utf8)!)
        data.append("Content-Disposition: form-data; name=\"\(paramName)\"; filename=\"\(fileName)\"\r\n".data(using: .utf8)!)
        data.append("Content-Type: image/png\r\n\r\n".data(using: .utf8)!)
        data.append(image.pngData()!)

        data.append("\r\n--\(boundary)--\r\n".data(using: .utf8)!)
        
        session.uploadTask(with: urlRequest, from: data, completionHandler: { responseData, response, error in
            if error == nil {
                let jsonData = try? JSONSerialization.jsonObject(with: responseData!, options: .allowFragments)
                
                if let json = jsonData as? [String: Any] {
                    print(json)
                }
            }
        })
        .resume()
    }
}
