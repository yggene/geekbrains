//
//  UserClass.swift
//  7l_EvgenyAlekseev
//
//  Created by Evgeny Alekseev on 08.08.2021.
//

class User {
    
    // Total users count
    static var counter = 0
    
    // User properties
    private var username: String {
        didSet {
            print("USER UPDATE: Username changed to \(username)\n")
        }
    }
    
    private var password: String {
        didSet {
            print("USER UPDATE: Password changed to \(password)\n")
        }
    }
    
    private var isLoggedIn: Bool = false {
        didSet {
            isLoggedIn ?
                print("*** Welcome, \(username)! ***\n") :
                print("*** Goodbye, \(username)! ***\n")
        }
    }
    
    private var age: Int? = nil
    
    // User methods
    init(username: String, password: String) throws {
        
        // Check if username already exists
        guard !users.keys.contains(username) else {
            throw UsernameErrors.existing
        }
        
        // Check if password is strong enough
        guard isValidPassword(password) else {
            throw PasswordErrors.weakPassword
        }
        
        self.username = username
        self.password = password
        
        // adding user to the list of users
        users[username] = password
        
        // Updating user counter
        User.counter += 1
        
        print("SYSTEM UPDATE: User \(username) appears\n")
    }
    
    deinit {
        users[username] = nil
        User.counter -= 1
        print("SYSTEM UPDATE: User \(username) disappears\n")
    }
    
    func login(username: String, password: String) throws {
        guard !isLoggedIn else {
            throw AccountErrors.loggedIn
        }
        guard users.keys.contains(username) else {
            throw AccountErrors.incorrectLogin
        }
        guard password == users[username] else {
            throw AccountErrors.incorrectPassword
        }
        isLoggedIn = true
    }
    
    func logout() throws {
        guard isLoggedIn else {
            throw AccountErrors.loggedOut
        }
        isLoggedIn = false
    }
    
    func updatePassword(to newPass: String) -> Result<String, PasswordErrors> {
        guard isValidPassword(newPass) else {
            print(PasswordErrors.weakPassword.rawValue)
            return .failure(.weakPassword)
        }
        password = newPass
        users[username] = password
        return .success(password)
    }
    
    func updateName(to newName: String) -> Result<String, UsernameErrors> {
        guard !users.keys.contains(newName) else {
            print(UsernameErrors.existing.rawValue)
            return .failure(.existing)
        }
        guard newName.count > 2 else {
            print(UsernameErrors.tooShort.rawValue)
            return .failure(.tooShort)
        }
        users[username] = nil
        self.username = newName
        users[username] = self.password
        return .success(username)
    }
    
    func setAge(to age: Int) throws {
        guard age > 0 else {
            print(AccountErrors.ageInvalid.rawValue)
            throw AccountErrors.ageInvalid
        }
        self.age = age
    }
    
    func getAge() -> (Int?, Error?) {
        guard let knownAge = self.age else {
            return (nil, AccountErrors.ageNotSet)
        }
        return (knownAge, nil)
    }

}

extension User: CustomStringConvertible {
    var description: String {
        return(
        """
        *** User info ***
        Name: \(username)
        Password: \(password)
        State: \(isLoggedIn ? "Online" : "Offline")
        
        """
        )
    }
}
