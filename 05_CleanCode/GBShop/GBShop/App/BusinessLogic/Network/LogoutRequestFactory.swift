//
//  AuthRequestFactory.swift
//  GBShop
//
//  Created by Evgeny Alekseev on 20.03.2022.
//

import Foundation
import Alamofire

protocol LogoutRequestFactory {
    func logout(userID: Int,
                completionHandler: @escaping (AFDataResponse<CommonResponseResult>) -> Void)
}
