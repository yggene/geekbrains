//
//  UILabel+Extensions.swift
//  iOSArchitecturesDemo
//
//  Created by Evgeny Alekseev on 19.01.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import Foundation

public extension String {
    static func iTunesDateFormatted(_ date: String) -> String {
        guard let endOfDate = date.firstIndex(of: "T") else { return "Not a date" }
        return String(date[..<endOfDate])
    }
}
