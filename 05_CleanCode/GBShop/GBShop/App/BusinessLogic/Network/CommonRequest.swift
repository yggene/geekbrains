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
    let baseURL = URL(string: "https://frozen-temple-04935.herokuapp.com/")!
//    let baseURL = URL(string: "http://127.0.0.1:8080/")!
    
    init(errorParser: AbstractErrorParser,
         sessionManager: Session,
         queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
}

// MARK: User login
extension CommonRequest: LoginRequestFactory {
    
    struct Login: RequestRouter {
        let baseURL: URL
        let method: HTTPMethod = .post
        let path: String = "login"
        
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
               completionHandler: @escaping (AFDataResponse<UserResponse>) -> Void) {
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
        let method: HTTPMethod = .post
        let path: String = "register"
        
        let userID: Int
        let username: String
        let password: String
        let email: String
        let gender: String
        let creditCard: String
        let bio: String
        
        var parameters: Parameters? {
            return [
                "userID": userID,
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
                  completionHandler: @escaping (AFDataResponse<CommonResponse>) -> Void) {
        
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
        self.request(request: requestModel,
                     completionHandler: completionHandler)
    }
}

// MARK: User Logout
extension CommonRequest: LogoutRequestFactory {
    struct Logout: RequestRouter {
        let baseURL: URL
        let method: HTTPMethod = .post
        let path: String = "logout"
        let userID: Int
        var parameters: Parameters? {
            return ["userID": userID]
        }
    }
    
    func logout(userID: Int, completionHandler: @escaping (AFDataResponse<CommonResponse>) -> Void) {
        let requestModel = Logout(baseURL: baseURL,
                                  userID: userID)
        self.request(request: requestModel,
                     completionHandler: completionHandler)
    }
}

// MARK: Change user data
extension CommonRequest: ChangeUserDataRequestFactory {
    
    struct ChangeUserData: RequestRouter {
        let baseURL: URL
        let method: HTTPMethod = .put
        let path: String = "update"
        
        let userID: Int
        let username: String
        let password: String
        let email: String
        let gender: String
        let creditCard: String
        let bio: String
        
        var parameters: Parameters? {
            return [
                "userID": userID,
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
                completionHandler: @escaping (AFDataResponse<CommonResponse>) -> Void) {
        
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
        self.request(request: requestModel,
                     completionHandler: completionHandler)
    }
}

// MARK: Get product info
extension CommonRequest: ProductRequestFactory {
    struct GetProduct: RequestRouter {
        let baseURL: URL
        let method: HTTPMethod = .post
        let path: String = "getProduct"
        
        let productID: Int
        var parameters: Parameters? {
            return ["productID": productID]
        }
    }
    
    func getProduct(productID: Int,
                    completionHandler: @escaping (AFDataResponse<ProductResponse>) -> Void) {
        let requestModel = GetProduct(baseURL: baseURL,
                                      productID: productID)
        self.request(request: requestModel,
                     completionHandler: completionHandler)
    }
}

// MARK: Get catalog info
extension CommonRequest: CatalogRequestFactory {
    struct GetCatalog: RequestRouter {
        let baseURL: URL
        let method: HTTPMethod = .post
        let path: String = "getCatalog"
        
        let pageNumber: Int
        let categoryID: Int
        var parameters: Parameters? {
            return [
                "pageNumber": pageNumber,
                "categoryID": categoryID
            ]
        }
    }
    
    func getCatalog(pageNumber: Int,
                    categoryID: Int,
                    completionHandler: @escaping (AFDataResponse<CatalogResponse>) -> Void) {
        let requestModel = GetCatalog(baseURL: baseURL,
                                      pageNumber: pageNumber,
                                      categoryID: categoryID)
        self.request(request: requestModel,
                     completionHandler: completionHandler)
    }
}
