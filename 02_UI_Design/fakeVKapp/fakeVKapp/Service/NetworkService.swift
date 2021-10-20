//
//  NetworkService.swift
//  fakeVKapp
//
//  Created by Evgeny Alekseev on 05.10.2021.
//

import Foundation

enum RequestErrors: String, Error {
    case invalidUrl = "Error: Invalid URL detected"
    case errorDecode = "Error: Decode problem. Check the JSON data"
    case failedRequest = "Request failed"
    case unknownError = "Error: Unknown"
    case alreadyInTheGroup = "Already in the group"
}

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
    func sendRequest(url: URL,
                     completion: @escaping (Data) -> Void) {
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
                    completion: @escaping (Result<[Friend], RequestErrors>) -> Void) {
        // compose an url
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
        
        // check if url is correct
        guard let url = urlConstructor.url else { return completion(.failure(.invalidUrl)) }
        
        session.dataTask(with: url) { data, response, error in
            if let response = response as? HTTPURLResponse {
                print("Status code: \(response.statusCode)")
            }
            
            // check if error happens
            if error != nil {
                completion(.failure(.failedRequest))
            } else if let data = data {
                // Success request
                do {
                    // Decode to an array of friends
                    let friends = try JSONDecoder().decode(VKResponse<Friends>.self, from: data)
                    
                    // save friends to Realm object
//                    try RealmService.save(items: completion(.success(friends)))
//                    let realm = try Realm()
//                    try! realm.write {
//                        realm.add(friends, update: .all)
//                    }
                    
                    DispatchQueue.main.async {
                        completion(.success(friends.response.items))
                    }
                    
                } catch {
                    // Send error when decoding
                    completion(.failure(.errorDecode))
                }
            } else {
                completion(.failure(.unknownError))
            }
        }.resume()
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
                value: "name,photo_200")
        )
        
        guard let url = urlConstructor.url else { return }
        
        sendRequest(url: url) { responseData in
            do {
                let userGroups = try JSONDecoder().decode(VKResponse<UserGroups>.self, from: responseData)
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
        urlConstructor.queryItems?.append(
            URLQueryItem(
                name: "extended",
                value: "1")
        )
        
        guard let url = urlConstructor.url else { return }
        
        sendRequest(url: url) { responseData in
            do {
                let userPhotos = try JSONDecoder().decode(VKResponse<UserPhotos>.self, from: responseData)
                completion(userPhotos.response.items)
            } catch {
                print(error)
            }
        }
    }
    
    // MARK: Get newsfeed
    
    func getNews(completion: @escaping ([News]) -> Void) {
        urlConstructor.path += "newsfeed.get"
        
        urlConstructor.queryItems?.append(
            URLQueryItem(
                name: "user_id",
                value: String(Session.instance.userID))
        )
        urlConstructor.queryItems?.append(
            URLQueryItem(
                name: "filters",
                value: "post")
        )
        urlConstructor.queryItems?.append(
            URLQueryItem(
                name: "max_photos",
                value: "1")
        )
        
        guard let url = urlConstructor.url else { return }
        
        sendRequest(url: url) { responseData in
            do {
                let newsfeed = try JSONDecoder().decode(VKResponse<Newsfeed>.self, from: responseData)
                completion(newsfeed.response.items)
            } catch {
                print(error)
            }
        }
    }
    
    // MARK: Join group
    func joinGroup(withID groupID: Int,
                   completion: @escaping (Result<Int, Error>) -> Void) {
        urlConstructor.path += "groups.join"
        
        urlConstructor.queryItems?.append(
            URLQueryItem(
                name: "group_id",
                value: String(groupID))
        )
        
        // check if url is correct
        guard let url = urlConstructor.url else { return }
        
        session.dataTask(with: url) { data, response, error in
            if let response = response as? HTTPURLResponse {
                print("Status code: \(response.statusCode)")
            }
            
            // check if error happens
            if error != nil {
                completion(.failure(RequestErrors.failedRequest))
            } else if let data = data {
                // Success request
                do {
                    // Decode to a response Int
                    let result = try JSONDecoder().decode(VKResponse<Int>.self, from: data)
                    
                    DispatchQueue.main.async {
                        completion(.success(result.response))
                    }
                    
                } catch {
                    // Send error when decoding
                    completion(.failure(RequestErrors.errorDecode))
                }
            } else {
                completion(.failure(RequestErrors.unknownError))
            }
        }.resume()
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
