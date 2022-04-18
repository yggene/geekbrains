//
//  LoginRequestFactory.swift
//  GBShop
//
//  Created by Evgeny Alekseev on 20.03.2022.
//

import Foundation
import Alamofire

protocol LoginRequestFactory {
    func login(username: String,
               password: String,
               completionHandler: @escaping (AFDataResponse<UserResponse>) -> Void)
}
