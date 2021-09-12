//
//  randoms.swift
//  fakeVKapp
//
//  Created by Evgeny Alekseev on 05.09.2021.
//

import UIKit

public func randomName() -> String {
        return randomFirstName() + " " + randomLastName()
    }
    
public func randomFirstName() -> String {
    let firstNameList = ["Anna", "Barbara", "Carl", "Dorothea", "Elsa", "Fred", "Garry", "Henry", "Isaac", "Jack", "Kenny", "Lara", "Megan", "Nancy", "Olga", "Priscilla", "Quinn", "Robert", "Sidney", "Terry", "Ubunti", "Victor", "Wendy", "Xenomorph", "Yakov", "Zack"]
    return firstNameList.randomElement() ?? "The list of first names is empty!"
    }
    
public func randomLastName() -> String {
        let lastNameList = ["Adams", "Berry", "Cole", "De la Rocha", "Enigma", "Freeman", "Goodwill", "Hendrix", "Isaac", "Jacobs", "Kenneth", "Laurie", "Martin", "Nox", "O'Reilly", "Pratchett", "Quinn", "Richards", "Stevens", "Thomas", "Ubuntson", "Ventrell", "Windsor", "Xavier", "Zappa", "Anderson", "Ashwoon", "Aikin", "Bateman", "Bongard", "Bowers", "Boyd", "Cannon", "Cast", "Deitz", "Dewalt", "Ebner", "Frick", "Hancock", "Haworth", "Hesch", "Hoffman", "Kassing", "Knutson", "Lawless", "Lawicki", "Mccord", "McCormack", "Miller", "Myers", "Nugent", "Ortiz", "Orwig", "Ory", "Paiser", "Pak", "Pettigrew", "Quinn", "Quizoz", "Ramachandran", "Resnick", "Sagar", "Schickowski", "Schiebel", "Sellon", "Severson", "Shaffer", "Solberg", "Soloman", "Sonderling", "Soukup", "Soulis", "Stahl", "Sweeney", "Tandy", "Trebil", "Trusela", "Trussel", "Turco", "Uddin", "Uflan", "Ulrich", "Upson", "Vader", "Vail", "Valente", "Van Zandt", "Vanderpoel", "Ventotla", "Vogal", "Wagle", "Wagner", "Wakefield", "Weinstein", "Weiss", "Woo", "Yang", "Yates", "Yocum", "Zeaser", "Zeller", "Ziegler", "Bauer", "Baxster", "Casal", "Cataldi", "Caswell", "Celedon", "Chambers", "Chapman", "Christensen", "Darnell", "Davidson", "Davis", "DeLorenzo", "Dinkins", "Doran", "Dugelman", "Dugan", "Duffman", "Eastman", "Ferro", "Ferry", "Fletcher", "Fietzer", "Hylan", "Hydinger", "Illingsworth", "Ingram", "Irwin", "Jagtap", "Jenson", "Johnson", "Johnsen", "Jones", "Jurgenson", "Kalleg", "Kaskel", "Keller", "Leisinger", "LePage", "Lewis", "Linde", "Lulloff", "Maki", "Martin", "McGinnis", "Mills", "Moody", "Moore", "Napier", "Nelson", "Norquist", "Nuttle", "Olson", "Ostrander", "Reamer", "Reardon", "Reyes", "Rice", "Ripka", "Roberts", "Rogers", "Root", "Sandstrom", "Sawyer", "Schlicht", "Schmitt", "Schwager", "Schutz", "Schuster", "Tapia", "Thompson", "Tiernan", "Tisler"]
        return lastNameList.randomElement() ?? "The list of last names is empty!"
}

public func randomAvatar() -> UIImage? {
    let imageName = String(Int.random(in: 1...14))
    return UIImage(named: imageName)
}

public func randomProfileId() -> Int {
    return Int.random(in: 1...friends.count)
}

public func randomNewsImage() -> UIImage? {
    let imageName = String(Int.random(in: 100...114))
    return UIImage(named: imageName)
}
