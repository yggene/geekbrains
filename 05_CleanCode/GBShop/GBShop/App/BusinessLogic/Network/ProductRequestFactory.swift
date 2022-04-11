//
//  ProductRequestFactory.swift
//  GBShop
//
//  Created by Evgeny Alekseev on 11.04.2022.
//

import Foundation
import Alamofire

protocol ProductRequestFactory {
    func getProduct(id: Int,
                    completionHandler: @escaping (AFDataResponse<Product>) -> Void)
}
