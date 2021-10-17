//
//  VKResponse.swift
//  fakeVKapp
//
//  Created by Evgeny Alekseev on 12.10.2021.
//

struct VKResponse<T: Codable> {
    let response: T
}

extension VKResponse: Codable {
    enum CodingKeys: String, CodingKey {
        case response
    }
}
