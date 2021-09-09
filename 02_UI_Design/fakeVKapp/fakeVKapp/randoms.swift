//
//  randoms.swift
//  fakeVKapp
//
//  Created by Evgeny Alekseev on 05.09.2021.
//

public func randomName() -> String {
        return randomFirstName() + " " + randomLastName()
    }
    
public func randomFirstName() -> String {
    let firstNameList = ["Anna", "Barbara", "Carl", "Dorothea", "Elsa", "Fred", "Garry", "Henry", "Isaac", "Jack", "Kenny", "Lara", "Megan", "Nancy", "Olga", "Priscilla", "Quinn", "Robert", "Sidney", "Terry", "Ubunti", "Victor", "Wendy", "Xenomorph", "Yakov", "Zack"]
        return firstNameList.randomElement()!
    }
    
public func randomLastName() -> String {
        let lastNameList = ["Adams", "Berry", "Cole", "De la Rocha", "Enigma", "Freeman", "Goodwill", "Hendrix", "Isaac", "Jacobs", "Kenneth", "Laurie", "Martin", "Nox", "O'Reilly", "Pratchett", "Quinn", "Richards", "Stevens", "Thomas", "Ubuntson", "Ventrell", "Windsor", "Xavier", "Zappa"]
        return lastNameList.randomElement()!
}
