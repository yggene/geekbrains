//
//  RequestFactory.swift
//  GBShop
//
//  Created by Evgeny Alekseev on 20.03.2022.
//

import Foundation
import Alamofire

class RequestFactory {
    func makeErrorParser() -> AbstractErrorParser {
        return ErrorParser()
    }
    
    lazy var commonSession: Session = {
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default
        let manager = Session(configuration: configuration)
        return manager
    }()
    
    let sessionQueue = DispatchQueue.global(qos: .utility)
    
    func makeAuthRequestFactory() -> LoginRequestFactory {
        let errorParser = makeErrorParser()
        return CommonRequest(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeRegisterUserRequestFactory() -> RegisterUserRequestFactory {
        let errorParser = makeErrorParser()
        return CommonRequest(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeLogoutRequestFactory() -> LogoutRequestFactory {
        let errorParser = makeErrorParser()
        return CommonRequest(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeChangeUserDataRequestFactory() -> ChangeUserDataRequestFactory {
        let errorParser = makeErrorParser()
        return CommonRequest(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeGetProductRequestFactory() -> ProductRequestFactory {
        let errorParser = makeErrorParser()
        return CommonRequest(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeGetCatalogRequestFactory() -> CatalogRequestFactory {
        let errorParser = makeErrorParser()
        return CommonRequest(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
}
