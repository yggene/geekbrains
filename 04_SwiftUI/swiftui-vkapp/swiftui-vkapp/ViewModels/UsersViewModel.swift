//
//  UsersViewModel.swift
//  swiftui-vkapp
//
//  Created by Evgeny Alekseev on 15.02.2022.
//

import SwiftUI

class UsersViewModel: ObservableObject {
    
    let user: User
    let networkService: NetworkService
    
    @Published var users: [User] = []
    
    init(user: User, networkService: NetworkService) {
        self.user = user
        self.networkService = networkService
    }
    
    public func fetchFriends() {
        networkService.getFriends() { [weak self] result in
            switch result {
            case let .success(users):
                self?.users = users
            case let .failure(error):
                print(error)
            }
        }
    }
}
