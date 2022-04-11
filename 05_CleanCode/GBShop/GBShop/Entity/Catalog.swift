//
//  Catalog.swift
//  GBShop
//
//  Created by Evgeny Alekseev on 11.04.2022.
//

import Foundation

struct Catalog: Codable {
    let result: Int?
    let pageNumber: Int
    let products: [Product]
    let errorMessage: String?
    
    enum CodingKeys: String, CodingKey {
        case result
        case pageNumber = "page_number"
        case products
        case errorMessage
    }
}
