//
//  ResponseResult.swift
//  GBShop
//
//  Created by Evgeny Alekseev on 20.03.2022.
//

import Foundation

struct CommonResponseResult: Codable {
    let result: Int?
    let userMessage: String?
    let errorMessage: String?
}

struct UserResponseResult: Codable {
    let user: User?
}

struct ProductResponseResult: Codable {
    let product: Product?
}

struct CatalogResponseResult: Codable {
    let catalog: Catalog?
}
