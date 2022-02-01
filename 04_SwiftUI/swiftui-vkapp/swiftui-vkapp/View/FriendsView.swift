//
//  FriendsView.swift
//  swiftui-vkapp
//
//  Created by Evgeny Alekseev on 31.01.2022.
//

import SwiftUI

struct FriendsView: View {
    
    var body: some View {
        List(friends) { friend in
            NavigationLink {
                FriendsPhotosView(friend)
            } label: {
                UserCellView(friend)
            }
        }
        .navigationTitle("Friends")
        Spacer()
    }
}

struct FriendsView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsView()
    }
}
