//
//  AbstractErrorParser.swift
//  GBShop
//
//  Created by Evgeny Alekseev on 17.03.2022.
//

import Foundation

protocol AbstractErrorParser {
    func parse(_ result: Error) -> Error
    func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error?
}
