//
//  NetworkService.swift
//  fakeVKapp
//
//  Created by Evgeny Alekseev on 05.10.2021.
//

import Foundation

final class NetworkService {
    
    private let session = URLSession.shared
    
    private var urlConstructor: URLComponents = {
        var constructor = URLComponents()
        constructor.scheme = "https"
        constructor.host = "api.vk.com"
        
        return constructor
    }()
    
    // MARK: URLSession request
    func sendRequest(_ request: String) {
        
        urlConstructor.path = "/method/" + request
        urlConstructor.queryItems = [
            URLQueryItem(
                name: "access_token",
                value: Session.instance.token),
            URLQueryItem(
                name: "v",
                value: "5.131"),
        ]
        
        switch request {
        case "friends.get":
            return
        case "groups.get":
            return
        case "photos.getAll":
            return
        case "groups.search":
            return
        default:
            return
        }
        
        guard let url = urlConstructor.url else { return }
        var request = URLRequest(url: url)
        request.timeoutInterval = 50.0
        request.setValue(
            "",
            forHTTPHeaderField: "Token")
        
        session.dataTask(with: request) { responseData, urlResponse, error in
            if let response = urlResponse as? HTTPURLResponse {
                print(response.statusCode)
            }
            guard
                error == nil,
                let responseData = responseData
            else { return }
            let json = try? JSONSerialization.jsonObject(
                with: responseData,
                options: .fragmentsAllowed)
            DispatchQueue.main.async {
                print(json as Any)
            }
        }
        .resume()
        
    }
}
