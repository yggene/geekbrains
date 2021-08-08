//
//  ServiceFunctions.swift
//  7l_EvgenyAlekseev
//
//  Created by Evgeny Alekseev on 08.08.2021.
//

// Function to retrieve passwords from users dictionary
func getPassword(of username: String) -> Result<String, DBErrors> {
    guard let passFound = users[username] else {
        print(DBErrors.userNotFound.rawValue)
        return .failure(.userNotFound)
    }
    print("Password for \(username) is \(passFound)")
    return .success(passFound)
}

// Function to check passwords
func isValidPassword(_ pass: String) -> Bool {
    pass.count > 7 && !weakPasswords.contains(pass)
}
