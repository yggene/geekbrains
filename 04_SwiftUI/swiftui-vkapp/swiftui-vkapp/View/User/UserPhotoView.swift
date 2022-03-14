//
//  UserPhotoView.swift
//  swiftui-vkapp
//
//  Created by Evgeny Alekseev on 31.01.2022.
//

import SwiftUI

struct UserPhotoView: View {
    let photo: Photo
    
    init(_ photo: Photo) {
        self.photo = photo
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
        FriendsSinglePhotoView(Photo(name: "default-avatar"))
    }
}
