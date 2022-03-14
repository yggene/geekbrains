//
//  NewsViewModel.swift
//  swiftui-vkapp
//
//  Created by Evgeny Alekseev on 15.02.2022.
//

import SwiftUI

class NewsViewModel: ObservableObject {
    

    let networkService: NetworkService
    
    @Published var newsFeed: Newsfeed

    
    init(newsFeed: Newsfeed, networkService: NetworkService) {
        self.newsFeed = newsFeed
        self.networkService = networkService
    }
    
    public func fetchNews() {
        networkService.getNews() { [weak self] result in
            switch result {
            case let .success(newsFeed):
                self?.newsFeed = newsFeed
            case let .failure(error):
                print(error)
            }
        }
    }
}
