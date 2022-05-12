//
//  Catalog.swift
//  GBShop
//
//  Created by Evgeny Alekseev on 11.04.2022.
//

import Foundation

struct Catalog: Codable {
    let result: Int?
    let products: [CatalogItem]?
    let errorMessage: String?
    
    enum CodingKeys: String, CodingKey {
        case result
        case products = ""
        case errorMessage
    }
}

struct CatalogItem: Codable {
    let productID: Int
    let productName: String
    let productPrice: Double
    
    enum CodingKeys: String, CodingKey {
        case productID = "id_product"
        case productName = "product_name"
        case productPrice = "price"
    }
}
