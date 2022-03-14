//
//  PhotosViewModel.swift
//  swiftui-vkapp
//
//  Created by Evgeny Alekseev on 15.02.2022.
//

import SwiftUI

class PhotosViewModel: ObservableObject {
    
    let photo: Photo
    let networkService: NetworkService
    
    @Published var photos: [Photo] = []
    
    init(photo: Photo, networkService: NetworkService) {
        self.photo = photo
        self.networkService = networkService
    }
    
    public func fetchPhotos() {
        networkService.getPhotos() { [weak self] result in
            switch result {
            case let .success(photos):
                self?.photos = photos
            case let .failure(error):
                print(error)
            }
        }
    }
}
