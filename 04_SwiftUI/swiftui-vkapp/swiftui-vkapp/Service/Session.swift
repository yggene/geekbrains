//
//  Session.swift
//  swiftui-vkapp
//
//  Created by Evgeny Alekseev on 07.02.2022.
//

class Session {
    
    static public let instance = Session()
    
    private init() {}
    
    var token: String = ""
    var userID: Int = 0
    
}
