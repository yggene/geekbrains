//
//  ErrorEnums.swift
//  7l_EvgenyAlekseev
//
//  Created by Evgeny Alekseev on 08.08.2021.
//

enum AccountErrors: String, Error {
    case incorrectLogin = "ERROR: Incorrect login\n"
    case incorrectPassword = "ERROR: Incorrect password\n"
    case loggedIn = "ERROR: User is already logged in\n"
    case loggedOut = "ERROR: User is already logged out\n"
    case ageNotSet = "ERROR: Age not set\n"
    case ageInvalid = "ERROR: Invalid age value\n"
}

enum PasswordErrors: String, Error {
    case weakPassword = "ERROR: Weak password\n"
}

enum UsernameErrors: String, Error {
    case existing = "ERROR: User alredy exists\n"
    case tooShort = "ERROR: Username is too short\n"
}

enum DBErrors: String, Error {
    case userNotFound = "ERROR: User not found\n"
}
