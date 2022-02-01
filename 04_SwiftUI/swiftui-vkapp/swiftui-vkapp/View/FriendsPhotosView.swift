//
//  FriendsView.swift
//  swiftui-vkapp
//
//  Created by Evgeny Alekseev on 31.01.2022.
//

import SwiftUI
import ASCollectionView

struct FriendsPhotosView: View {
    let friend: Friend
    
    init(_ friend: Friend) {
        self.friend = friend
    }
    
    init() {
        self.friend = friends[0]
    }
    
    var body: some View {
        ASCollectionView(data: friend.photos) { photo, context in
            NavigationLink {
                FriendsSinglePhotoView(photo)
            } label: {
                FriendsSinglePhotoView(photo)
            }
        }
        .layout { .grid(layoutMode: .fixedNumberOfColumns(2),
                        itemSpacing: 16,
                        lineSpacing: 16)
        }
    }
}


struct FriendsPhotosView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsPhotosView()
    }
}
