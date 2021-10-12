//
//  NetworkService.swift
//  fakeVKapp
//
//  Created by Evgeny Alekseev on 05.10.2021.
//

import Foundation

final class NetworkService {
    
    private let session = URLSession.shared
    
    // MARK: Compose the constant part of the API url
    private var urlConstructor: URLComponents = {
        var constructor = URLComponents()
        constructor.scheme = "https"
        constructor.host = "api.vk.com"
        constructor.path = "/method/"
        constructor.queryItems = [
            URLQueryItem(
                name: "access_token",
                value: Session.instance.token),
            URLQueryItem(
                name: "v",
                value: "5.131"),
        ]
        return constructor
    }()
    
    // MARK: Create the request
    func sendRequest(url: URL, completion: @escaping (Data) -> Void) {
        var request = URLRequest(url: url)
        request.timeoutInterval = 5.0
        
        session.dataTask(with: request) { responseData, urlResponse, error in
            if let response = urlResponse as? HTTPURLResponse {
                print(response.statusCode)
            }
            guard
                error == nil,
                let responseData = responseData
            else { return }
            
            DispatchQueue.main.async {
                completion(responseData)
            }
        }
        .resume()
    }
    
    // MARK: Get friends
    func getFriends(ofUser userID: Int = Session.instance.userID,
                    completion: @escaping ([Friend]) -> Void) {
        urlConstructor.path += "friends.get"
        
        urlConstructor.queryItems?.append(
            URLQueryItem(
                name: "user_id",
                value: String(userID))
        )
        urlConstructor.queryItems?.append(
            URLQueryItem(
                name: "fields",
                value: "city,photo_200_orig")
        )
        
        guard let url = urlConstructor.url else { return }
        
        sendRequest(url: url) { responseData in
            do {
                let friends = try JSONDecoder().decode(VKResponse<Friends>.self, from: responseData)
                completion(friends.response.items)
            } catch {
                print(error)
            }
        }
    }
    
    // MARK: Get popular groups
    func getPopularGroups(completion: @escaping ([Group]) -> Void) {
        urlConstructor.path += "groups.getCatalog"
        
        urlConstructor.queryItems?.append(
            URLQueryItem(
                name: "category_id",
                value: "0")
        )
        
        guard let url = urlConstructor.url else { return }
        
        sendRequest(url: url) { responseData in
            do {
                let popularGroups = try JSONDecoder().decode(VKResponse<popularGroups>.self, from: responseData)
                completion(popularGroups.response.items)
            } catch {
                print(error)
            }
        }
    }
    
    // MARK: Get user groups
    func getGroups(ofUser userID: Int = Session.instance.userID,
                   completion: @escaping ([Group]) -> Void) {
        urlConstructor.path += "groups.get"
        
        urlConstructor.queryItems?.append(
            URLQueryItem(
                name: "user_id",
                value: String(userID))
        )
        urlConstructor.queryItems?.append(
            URLQueryItem(
                name: "extended",
                value: "1")
        )
        urlConstructor.queryItems?.append(
            URLQueryItem(
                name: "fields",
                value: "name,photo_50")
        )
        
        guard let url = urlConstructor.url else { return }
        
        sendRequest(url: url) { responseData in
            do {
                let userGroups = try JSONDecoder().decode(VKResponse<userGroups>.self, from: responseData)
                completion(userGroups.response.items)
            } catch {
                print(error)
            }
        }
    }
    
    // MARK: Get all photos
    func getPhotos(ofUser userID: Int = Session.instance.userID,
                   completion: @escaping ([Photo]) -> Void) {
        urlConstructor.path += "photos.getAll"
        
        urlConstructor.queryItems?.append(
            URLQueryItem(
                name: "owner_id",
                value: String(userID))
        )
        
        guard let url = urlConstructor.url else { return }
        
        sendRequest(url: url) { responseData in
            do {
                let userPhotos = try JSONDecoder().decode(VKResponse<userPhotos>.self, from: responseData)
                completion(userPhotos.response.items)
            } catch {
                print(error)
            }
        }
    }
    
    // MARK: [INCOMPLETE] Search groups
    func searchGroups(groupSearchQuery: String,
                      completion: @escaping ([Group]) -> Void) {
        
        urlConstructor.queryItems?.append(
            URLQueryItem(
                name: "q",
                value: groupSearchQuery)
        )
    }
}
