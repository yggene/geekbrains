//
//  FriendsView.swift
//  swiftui-vkapp
//
//  Created by Evgeny Alekseev on 31.01.2022.
//

import SwiftUI

struct FriendsSinglePhotoView: View {
    let photo: Photo
    
    init(_ photo: Photo) {
        self.photo = photo
    }
    
    init() {
        self.photo = Photo(name: "default-avatar")
    }
    
    var body: some View {
        Image("\(photo.name)")
                .resizable()
                .ignoresSafeArea(.all)
                .scaledToFit()
    }
}

struct FriendsSinglePhotoView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsSinglePhotoView()
    }
}
