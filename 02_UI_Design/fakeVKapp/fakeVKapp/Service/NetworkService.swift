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
    func sendRequest(requestName: Requests,
                     ofUser userID: Int? = Session.instance.userID,
                     groupSearchQuery: String? = ""
    ){
        
        urlConstructor.path = "/method/" + requestName.rawValue
        urlConstructor.queryItems = [
            URLQueryItem(
                name: "access_token",
                value: Session.instance.token),
            URLQueryItem(
                name: "v",
                value: "5.131"),
        ]
        
        switch requestName {
        case .getFriends:
            urlConstructor.queryItems?.append(
                URLQueryItem(
                    name: "user_id",
                    value: String(userID ?? Session.instance.userID))
            )
            urlConstructor.queryItems?.append(
                URLQueryItem(
                    name: "fields",
                    value: "city,photo_200_orig")
            )
        case .getGroups:
            urlConstructor.queryItems?.append(
                URLQueryItem(
                    name: "user_id",
                    value: String(userID ?? Session.instance.userID))
            )
            urlConstructor.queryItems?.append(
                URLQueryItem(
                    name: "extended",
                    value: "1")
            )
            urlConstructor.queryItems?.append(
                URLQueryItem(
                    name: "fields",
                    value: "name,photo_100")
            )
        case .getAllPhotos:
            urlConstructor.queryItems?.append(
                URLQueryItem(
                    name: "owner_id",
                    value: String(userID ?? Session.instance.userID))
            )
        case .searchGroups:
            urlConstructor.queryItems?.append(
                URLQueryItem(
                    name: "q",
                    value: groupSearchQuery ?? "")
            )
        }
        
        guard let url = urlConstructor.url else { return }
        var request = URLRequest(url: url)
        request.timeoutInterval = 5.0
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
