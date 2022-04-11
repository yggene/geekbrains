//
//  Auth.swift
//  GBShop
//
//  Created by Evgeny Alekseev on 20.03.2022.
//

import Foundation
import Alamofire

class CommonRequest: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseURL = URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/")!
    
    init(errorParser: AbstractErrorParser,
         sessionManager: Session,
         queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
}

// MARK: User login
extension CommonRequest: AuthRequestFactory {
    struct Login: RequestRouter {
        let baseURL: URL
        let method: HTTPMethod = .get
        let path: String = "login.json"
        
        let username: String
        let password: String
        var parameters: Parameters? {
            return [
                "username": login,
                "password": password
            ]
        }
    }
    
    func login(username: String,
               password: String,
               completionHandler: @escaping (AFDataResponse<CommonResponseResult>) -> Void) {
        let requestModel = Login(baseURL: baseURL,
                                 username: username,
                                 password: password)
        self.request(request: requestModel,
                     completionHandler: completionHandler)
    }
}

// MARK: User registration
extension CommonRequest: RegisterUserRequestFactory {
    struct Registration: RequestRouter {
        let baseURL: URL
        let method: HTTPMethod = .get
        let path: String = "registerUser.json"
        
        let userID: Int
        let username: String
        let password: String
        let email: String
        let gender: String
        let creditCard: String
        let bio: String
        
        var parameters: Parameters? {
            return ["id_user": userID,
                    "username": username,
                    "password": password,
                    "email": email,
                    "gender": gender,
                    "creditCard": creditCard,
                    "bio": bio
            ]
        }
    }
    
    func register(userID: Int,
                  username: String,
                  password: String,
                  email: String,
                  gender: String,
                  creditCard: String,
                  bio: String,
                  completionHandler: @escaping (AFDataResponse<CommonResponseResult>) -> Void) {
        
        guard creditCard.count == 16 else {
            print("Incorrect credit card number")
            return
        }
        
        guard email.contains("@") else {
            print("Incorect email")
            return
        }
        
        let requestModel = Registration(baseURL: baseURL,
                                        userID: userID,
                                        username: username,
                                        password: password,
                                        email: email,
                                        gender: gender,
                                        creditCard: creditCard,
                                        bio: bio)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

// MARK: User Logout
extension CommonRequest: LogoutRequestFactory {
    struct Logout: RequestRouter {
        let baseURL: URL
        let method: HTTPMethod = .get
        let path: String = "logout.json"
        let userID: Int
        var parameters: Parameters? {
            return ["id_user": userID]
        }
    }
    
    func logout(userID: Int, completionHandler: @escaping (AFDataResponse<CommonResponseResult>) -> Void) {
        let requestModel = Logout(baseURL: baseURL, userID: userID)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

// MARK: Change user data
extension CommonRequest: ChangeUserDataRequestFactory {
    
    struct ChangeUserData: RequestRouter {
        let baseURL: URL
        let method: HTTPMethod = .get
        let path: String = "changeUserData.json"
        
        let userID: Int
        let username: String
        let password: String
        let email: String
        let gender: String
        let creditCard: String
        let bio: String
        
        var parameters: Parameters? {
            return ["id_user": userID,
                    "username": username,
                    "password": password,
                    "email": email,
                    "gender": gender,
                    "creditCard": creditCard,
                    "bio": bio
            ]
        }
    }
    
    func change(userID: Int,
                username: String,
                password: String,
                email: String,
                gender: String,
                creditCard: String,
                bio: String,
                completionHandler: @escaping (AFDataResponse<CommonResponseResult>) -> Void) {
        
        guard creditCard.count == 16 else {
            print("Incorrect credit card number")
            return
        }
        
        guard email.contains("@") else {
            print("Incorect email")
            return
        }
        
        let requestModel = ChangeUserData(baseURL: baseURL,
                                          userID: userID,
                                          username: username,
                                          password: password,
                                          email: email,
                                          gender: gender,
                                          creditCard: creditCard,
                                          bio: bio)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}
