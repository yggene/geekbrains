//
//  FriendsView.swift
//  swiftui-vkapp
//
//  Created by Evgeny Alekseev on 31.01.2022.
//

import SwiftUI
import ASCollectionView

struct FriendsPhotosView: View {
    let friend: User
    
    init(_ friend: User) {
        self.friend = friend
    }
    
    var body: some View {
        ASCollectionView(data: friend.photos) { photo, _ in
            NavigationLink {
                FriendsSinglePhotoView(photo)
            } label: {
                FriendsSinglePhotoView(photo)
            }
        }
        .layout
        { .grid(
            layoutMode: .fixedNumberOfColumns(2),
            itemSpacing: 16,
            lineSpacing: 16)
        }
    }
}


struct FriendsPhotosView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsPhotosView(friends[0])
    }
}
