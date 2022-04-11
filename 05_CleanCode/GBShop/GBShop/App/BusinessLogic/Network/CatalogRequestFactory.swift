//
//  CatalogRequestFactory.swift
//  GBShop
//
//  Created by Evgeny Alekseev on 11.04.2022.
//

import Foundation
import Alamofire

protocol CatalogRequestFactory {
    func getCatalog(pageNumber: Int,
                    categoryID: Int,
                    completionHandler: @escaping (AFDataResponse<CommonResponseResult>) -> Void)
}
