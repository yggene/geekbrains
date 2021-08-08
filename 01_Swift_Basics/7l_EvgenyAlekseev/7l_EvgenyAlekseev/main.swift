//
//  main.swift
//  7l_EvgenyAlekseev
//
//  Created by Evgeny Alekseev on 08.08.2021.
//

// Declaring users

func main() {
    
    var user1: User?
    
    // trying to create a user
    do {
        user1 = try User(username: "zeroCool", password: "Password")
        print(user1 ?? "User not found")
    } catch UsernameErrors.existing {
        print(UsernameErrors.existing.rawValue)
    } catch PasswordErrors.weakPassword {
        print(PasswordErrors.weakPassword.rawValue)
    } catch {
        print("ERROR: Unknown")
    }
    
    // authorizing a user
    do {
        try user1?.login(username: "zeroCool", password: "Password")
    } catch AccountErrors.incorrectLogin {
        print(AccountErrors.incorrectLogin.rawValue)
    } catch AccountErrors.loggedIn {
        print(AccountErrors.loggedIn.rawValue)
    } catch AccountErrors.incorrectPassword {
        print(AccountErrors.incorrectPassword.rawValue)
    } catch {
        print("ERROR: Unknown")
    }
    
    // updating username and password for a user
    _ = user1?.updatePassword(to: "WearyStrunPussw0rt!")
    _ = user1?.updateName(to: "CEREAL KILLER")
    
    print(getPassword(of: "CEREAL KILLER"))
    
    // setting age of a user
    do {
        try user1?.setAge(to: 28)
    } catch AccountErrors.ageInvalid {
        print(AccountErrors.ageInvalid.rawValue)
    } catch {
        print("ERROR: Unknown")
    }
    
    // checking age of a user
    let ageOfUser = user1?.getAge()
    if let error = ageOfUser?.1 {
        print("ERROR: \(error)")
    } else if let age = ageOfUser?.0 {
        print("Age is \(age)")
    }
    
    user1 = nil
    
}

main()
