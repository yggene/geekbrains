//
//  VKResponse.swift
//  fakeVKapp
//
//  Created by Evgeny Alekseev on 12.10.2021.
//

struct VKResponse<T: Decodable> {
    let response: T
}

extension VKResponse: Decodable {
    enum CodingKeys: String, CodingKey {
        case response
    }
}
