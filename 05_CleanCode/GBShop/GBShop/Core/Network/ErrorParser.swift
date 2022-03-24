//
//  ErrorParser.swift
//  GBShop
//
//  Created by Evgeny Alekseev on 17.03.2022.
//

import Foundation

class ErrorParser: AbstractErrorParser {
    
    func parse(_ result: Error) -> Error {
        result
    }
    
    func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error? {
        error
    }
    
}
