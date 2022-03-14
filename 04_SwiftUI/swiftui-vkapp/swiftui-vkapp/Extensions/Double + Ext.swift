//
//  Double + Ext.swift
//  swiftui-vkapp
//
//  Created by Evgeny Alekseev on 07.02.2022.
//

import Foundation

extension Double {
    func date() -> String {
        let date = Date(timeIntervalSince1970: self)
        let dateFormatter = DateFormatter()
        // dateFormatter.locale = Locale(identifier: "ru_RU")
        dateFormatter.dateFormat = "dd MMMM YYYY 'at' HH:mm"
        return dateFormatter.string(from: date)
    }
}
