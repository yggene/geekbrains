//
//  NetworkService.swift
//  fakeVKapp
//
//  Created by Evgeny Alekseev on 05.10.2021.
//

import Foundation
import RealmSwift

enum RequestErrors: String, Error {
    case invalidUrl
    case errorDecode
    case failedRequest
    case unknownError
    case realmSaveFailure
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
    
    // MARK: Get friends
    func getFriends(ofUser userID: Int = Session.instance.userID) {
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
            guard let url = urlConstructor.url else {
                print("Error: " + RequestErrors.invalidUrl.rawValue)
                return
            }
            
            session.dataTask(with: url) { data, response, error in
                if let response = response as? HTTPURLResponse {
                    print("Status code: \(response.statusCode)")
                }
                
                // check if error happens
                if error != nil {
                    print("Error: " + RequestErrors.failedRequest.rawValue)
                } else if let data = data {
                    // Successful request
                    do {
                        // Decode to an array of friends
                        let friends = try JSONDecoder().decode(VKResponse<Friends>.self, from: data)
                        
                        DispatchQueue.main.async {
                            // save friends to Realm object
                            do {
                                try RealmService.save(items: friends.response.items)
                            } catch {
                                print("Error: " + RequestErrors.realmSaveFailure.rawValue)
                            }
                            print("Success: Friends saved to Realm")
                        }
                        
                    } catch {
                        // Send error when decoding
                        print("Error: " + RequestErrors.errorDecode.rawValue)
                    }
                } else {
                    print("Error: " + RequestErrors.unknownError.rawValue)
                }
            }.resume()
        }
    
    // MARK: Get popular groups
    func getPopularGroups(completion: @escaping (Result<[Group], RequestErrors>) -> Void) {
        urlConstructor.path += "groups.getCatalog"
        
        urlConstructor.queryItems?.append(
            URLQueryItem(
                name: "category_id",
                value: "0")
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
                // Successful request
                do {
                    // Decode to an array of popular groups
                    let popularGroups = try JSONDecoder().decode(VKResponse<popularGroups>.self, from: data)
                    
                    DispatchQueue.main.async {
                        completion(.success(popularGroups.response.items))
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
    
    
    // MARK: Get user groups
    func getGroups(ofUser userID: Int = Session.instance.userID) {
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
        
        // check if url is correct
        guard let url = urlConstructor.url else {
            print("Error: " + RequestErrors.invalidUrl.rawValue)
            return
        }
        
        session.dataTask(with: url) { data, response, error in
            if let response = response as? HTTPURLResponse {
                print("Status code: \(response.statusCode)")
            }
            
            // check if error happens
            if error != nil {
                print("Error: " + RequestErrors.failedRequest.rawValue)
            } else if let data = data {
                // Successful request
                do {
                    // Decode to an array of users' groups
                    let userGroups = try JSONDecoder().decode(VKResponse<UserGroups>.self, from: data)
                    
                    DispatchQueue.main.async {
                        // save groups to Realm object
                        do {
                            try RealmService.save(items: userGroups.response.items)
                        } catch {
                            print("Error: " + RequestErrors.realmSaveFailure.rawValue)
                        }
                        print("Success: User groups saved to realm!")
                    }
                    
                } catch {
                    // Send error when decoding
                    print("Error: " + RequestErrors.errorDecode.rawValue)
                }
            } else {
                print("Error: " + RequestErrors.unknownError.rawValue)
            }
        }.resume()
    }
    
    // MARK: Get all photos
    func getPhotos(ofUser userID: Int = Session.instance.userID) {
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
        
        // check if url is correct
        guard let url = urlConstructor.url else {
            print("Error: " + RequestErrors.invalidUrl.rawValue)
            return
        }
        
        session.dataTask(with: url) { data, response, error in
            if let response = response as? HTTPURLResponse {
                print("Status code: \(response.statusCode)")
            }
            
            // check if error happens
            if error != nil {
                print("Error: " + RequestErrors.failedRequest.rawValue)
            } else if let data = data {
                // Successful request
                do {
                    // Decode to an array of friends' photos
                    let userPhotos = try JSONDecoder().decode(VKResponse<UserPhotos>.self, from: data)
                    
                    DispatchQueue.main.async {
                        // save friends' photos to Realm object
                        do {
                            try RealmService.save(items: userPhotos.response.items)
                        } catch {
                            print("Error " + RequestErrors.realmSaveFailure.rawValue)
                        }
                        print("Success: got all the photos")
                    }
                    
                } catch {
                    // Send error when decoding
                    print("Error: " + RequestErrors.errorDecode.rawValue)
                }
            } else {
                print("Error: " + RequestErrors.unknownError.rawValue)
            }
        }.resume()
    }
    
    
    // MARK: Get newsfeed
    
    func getNews(completion: @escaping (Result<[News], RequestErrors>) -> Void) {
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
                // Successful request
                do {
                    // Decode to an array of news
                    let newsFeed = try JSONDecoder().decode(VKResponse<Newsfeed>.self, from: data)
                    
                    DispatchQueue.main.async {
                        completion(.success(newsFeed.response.items))
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
    
    // MARK: Join group
    func joinGroup(withID groupID: Int,
                   completion: @escaping (Result<Int?, RequestErrors>) -> Void) {
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
                completion(.failure(.failedRequest))
            } else if let data = data {
                // Success request
                DispatchQueue.main.async {
                    do {
                        // Decode to a response Int
                        let result = try JSONDecoder().decode(VKResponse<Int?>.self, from: data)
                        completion(.success(result.response))
                        
                    } catch {
                        /* It's OK to get nil here
                         VK api groups.join method returns 1 on successful join,
                         or nil if user is already in the group,
                         or specific error code*/
                        completion(.success(nil))
                    }
                }
            } else {
                completion(.failure(.unknownError))
            }
        }.resume()
    }
    
    // MARK: [TODO] Search groups
    func searchGroups(groupSearchQuery: String,
                      completion: @escaping ([Group]) -> Void) {
        
        urlConstructor.queryItems?.append(
            URLQueryItem(
                name: "q",
                value: groupSearchQuery)
        )
    }
    
    // MARK: [TODO] Leave Group
}
