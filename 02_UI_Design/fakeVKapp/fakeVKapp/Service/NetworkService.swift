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
    
    // MARK: Get user info
    func getUserInfo(withID userID: Int,
                     completion: @escaping (Result<[Friend], RequestErrors>) -> Void) {
        var requestURL = urlConstructor
        requestURL.path += "users.get"
        requestURL.queryItems?.append(
            URLQueryItem(name: "user.ids", value: String(userID))
        )
        requestURL.queryItems?.append(
            URLQueryItem(name: "fields", value: "photo_200_orig")
        )
        
        guard let url = requestURL.url else { return completion(.failure(.invalidUrl)) }
        
        session.dataTask(with: url) { data, response, error in
            if let response = response as? HTTPURLResponse {
                print("Status code: \(response.statusCode)")
            }
            
            if error != nil {
                completion(.failure(.failedRequest))
            } else if let data = data {
                do {
                    // Decode to an array of friends
                    let friend = try JSONDecoder().decode(VKResponse<[Friend]>.self, from: data)
                    
                    DispatchQueue.main.async {
                        completion(.success(friend.response))
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
    
    // MARK: Get group info
    
    func getGroupInfo(withID groupID: Int,
                     completion: @escaping (Result<[Group], RequestErrors>) -> Void) {
        var requestURL = urlConstructor
        requestURL.path += "groups.getById"
        requestURL.queryItems?.append(
            URLQueryItem(name: "user.ids", value: String(-groupID))
        )
        
        guard let url = requestURL.url else { return completion(.failure(.invalidUrl)) }
        
        session.dataTask(with: url) { data, response, error in
            if let response = response as? HTTPURLResponse {
                print("Status code: \(response.statusCode)")
            }
            
            if error != nil {
                completion(.failure(.failedRequest))
            } else if let data = data {
                do {
                    // Decode to an array of friends
                    let group = try JSONDecoder().decode(VKResponse<[Group]>.self, from: data)
                    
                    DispatchQueue.main.async {
                        completion(.success(group.response))
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
    
    // MARK: Get friends
    func getFriends(ofUser userID: Int = Session.instance.userID,
                    completion: @escaping (Result<[Friend], RequestErrors>) -> Void) {
        // compose an url
        var requestURL = urlConstructor
        requestURL.path += "friends.get"
        requestURL.queryItems?.append(
            URLQueryItem(
                name: "user_id",
                value: String(userID))
        )
        requestURL.queryItems?.append(
            URLQueryItem(
                name: "fields",
                value: "city,photo_200_orig")
        )
        
        // check if url is correct
        guard let url = requestURL.url else { return completion(.failure(.invalidUrl)) }
        
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
                    // Decode to an array of friends
                    let friends = try JSONDecoder().decode(VKResponse<Friends>.self, from: data)
                    
                    DispatchQueue.main.async {
                        // save friends to Realm object
                        do {
                            try RealmService.save(items: friends.response.items)
                        } catch {
                            completion(.failure(.realmSaveFailure))
                        }
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
    func getPopularGroups(completion: @escaping (Result<[Group], RequestErrors>) -> Void) {
        var requestUrl = urlConstructor
        requestUrl.path += "groups.getCatalog"
        requestUrl.queryItems?.append(
            URLQueryItem(
                name: "category_id",
                value: "0")
        )
        
        // check if url is correct
        guard let url = requestUrl.url else { return completion(.failure(.invalidUrl)) }
        
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
    func getGroups(ofUser userID: Int = Session.instance.userID,
                   completion: @escaping (Result<[Group], RequestErrors>) -> Void) {
        var requestUrl = urlConstructor
        requestUrl.path += "groups.get"
        
        requestUrl.queryItems?.append(
            URLQueryItem(
                name: "user_id",
                value: String(userID))
        )
        requestUrl.queryItems?.append(
            URLQueryItem(
                name: "extended",
                value: "1")
        )
        requestUrl.queryItems?.append(
            URLQueryItem(
                name: "fields",
                value: "name,photo_200")
        )
        
        // check if url is correct
        guard let url = requestUrl.url else { return completion(.failure(.invalidUrl)) }
        
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
                    // Decode to an array of users' groups
                    let userGroups = try JSONDecoder().decode(VKResponse<UserGroups>.self, from: data)
                    
                    DispatchQueue.main.async {
                        // save groups to Realm object
                        do {
                            try RealmService.save(items: userGroups.response.items)
                        } catch {
                            completion(.failure(.realmSaveFailure))
                        }
                        completion(.success(userGroups.response.items))
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
    
    // MARK: Get all photos
    func getPhotos(ofUser userID: Int = Session.instance.userID,
                   completion: @escaping (Result<[Photo], RequestErrors>) -> Void) {
        var requestUrl = urlConstructor
        requestUrl.path += "photos.getAll"
        
        requestUrl.queryItems?.append(
            URLQueryItem(
                name: "owner_id",
                value: String(userID))
        )
        requestUrl.queryItems?.append(
            URLQueryItem(
                name: "extended",
                value: "1")
        )
        
        // check if url is correct
        guard let url = requestUrl.url else { return completion(.failure(.invalidUrl)) }
        
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
                    // Decode to an array of friends' photos
                    let userPhotos = try JSONDecoder().decode(VKResponse<UserPhotos>.self, from: data)
                    
                    DispatchQueue.main.async {
                        // save friends' photos to Realm object
                        do {
                            try RealmService.save(items: userPhotos.response.items)
                        } catch {
                            completion(.failure(.realmSaveFailure))
                        }
                        completion(.success(userPhotos.response.items))
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
    
    
    // MARK: Get newsfeed
    
    func getNews(completion: @escaping (Result<[News], RequestErrors>) -> Void) {
        var requestUrl = urlConstructor
        requestUrl.path += "newsfeed.get"
        
        requestUrl.queryItems?.append(
            URLQueryItem(
                name: "user_id",
                value: String(Session.instance.userID))
        )
        requestUrl.queryItems?.append(
            URLQueryItem(
                name: "filters",
                value: "post, photo")
        )
        requestUrl.queryItems?.append(
            URLQueryItem(
                name: "max_photos",
                value: "1")
        )
        
        // check if url is correct
        guard let url = requestUrl.url else { return completion(.failure(.invalidUrl)) }
        
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
        var requestUrl = urlConstructor
        requestUrl.path += "groups.join"
        
        requestUrl.queryItems?.append(
            URLQueryItem(
                name: "group_id",
                value: String(groupID))
        )
        
        // check if url is correct
        guard let url = requestUrl.url else { return }
        
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
        var requestUrl = urlConstructor
        requestUrl.queryItems?.append(
            URLQueryItem(
                name: "q",
                value: groupSearchQuery)
        )
    }
    
    // MARK: [TODO] Leave Group
}
