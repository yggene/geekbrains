//
//  AuthRequestFactory.swift
//  GBShop
//
//  Created by Evgeny Alekseev on 20.03.2022.
//

import Foundation
import Alamofire

protocol ChangeUserDataRequestFactory {
    func change(userID: Int,
                username: String,
                password: String,
                email: String,
                gender: String,
                creditCard: String,
                bio: String,
                completionHandler: @escaping (AFDataResponse<CommonResponse>) -> Void)
}
