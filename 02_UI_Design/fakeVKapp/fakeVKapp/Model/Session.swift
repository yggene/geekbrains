//
//  Session.swift
//  fakeVKapp
//
//  Created by Evgeny Alekseev on 03.10.2021.
//

class Session {
    
    static public let instance = Session()
    
    private init() {}
    
    var token: String = ""
    var userID: Int = 0
    
}
