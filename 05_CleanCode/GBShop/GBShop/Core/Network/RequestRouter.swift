//
//  RequestRouter.swift
//  GBShop
//
//  Created by Evgeny Alekseev on 20.03.2022.
//

import Foundation
import Alamofire

enum RequestRouterEncoding {
    case url, json
}

protocol RequestRouter: URLRequestConvertible {
    var baseURL: URL { get }
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: Parameters? { get }
    var fullURL: URL { get }
    var encoding: RequestRouterEncoding { get }
}


extension RequestRouter {
    var fullURL: URL {
        return baseURL.appendingPathComponent(path)
    }
    
    var encoding: RequestRouterEncoding {
        return .url
    }
    
    func asURLRequest() throws -> URLRequest {
        var URLRequest = URLRequest(url: fullURL)
        URLRequest.httpMethod = method.rawValue
        
        switch self.encoding {
        case .url:
            return try URLEncoding.default.encode(URLRequest, with: parameters)
        case .json:
            return try JSONEncoding.default.encode(URLRequest, with: parameters)
        }
    }
}
