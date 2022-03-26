//
//  AuthRequestFactory.swift
//  GBShop
//
//  Created by Evgeny Alekseev on 20.03.2022.
//

import Foundation
import Alamofire

enum Gender: String {
    case m = "m"
    case f = "f"
}

protocol ChangeUserDataRequestFactory {
    func change(userID: Int,
                username: String,
                password: String,
                email: String,
                gender: String,
                creditCard: String,
                bio: String,
                completionHandler: @escaping (AFDataResponse<ResponseResult>) -> Void)
}
