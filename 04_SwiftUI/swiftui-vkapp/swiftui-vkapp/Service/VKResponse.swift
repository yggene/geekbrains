//
//  VKResponse.swift
//  swiftui-vkapp
//
//  Created by Evgeny Alekseev on 07.02.2022.
//

struct VKResponse<T: Codable> {
    let response: T
}

extension VKResponse: Codable {
    enum CodingKeys: String, CodingKey {
        case response
    }
}
