//
//  CommunitiesViewModel.swift
//  swiftui-vkapp
//
//  Created by Evgeny Alekseev on 15.02.2022.
//

import SwiftUI

class CommunitiesViewModel: ObservableObject {
    
    let community: Community
    let networkService: NetworkService
    
    @Published var communities: [Community] = []
    
    init(community: Community, networkService: NetworkService) {
        self.community = community
        self.networkService = networkService
    }
    
    public func fetchCommunities() {
        networkService.getCommunities() { [weak self] result in
            switch result {
            case let .success(communities):
                self?.communities = communities
            case let .failure(error):
                print(error)
            }
        }
    }
}
