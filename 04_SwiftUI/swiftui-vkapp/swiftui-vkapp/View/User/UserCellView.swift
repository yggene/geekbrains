//
//  UserCellView.swift
//  swiftui-vkapp
//
//  Created by Evgeny Alekseev on 28.01.2022.
//

import SwiftUI

struct UserCellView: View {
    var name: String
    var city: String
    var avatar: String
    
    init(_ friend: User) {
        self.name = friend.firstName + friend.lastName
        self.city = friend.city?.title ?? "default city"
        self.avatar = friend.avatar
    }
    
    // default init
    init() {
        self.name = "Random name"
        self.city = "Random origin"
        self.avatar = "default-avatar"
    }
    
    var body: some View {
        HStack {
            UserAvatarView {
                Image(avatar)
                    .resizable()
            }
            VStack(alignment: .leading) {
                Text(name)
                Text(city)
                    .font(.caption2)
            }
        }
    }
}

// MARK: - Preview
struct UserCellView_Previews: PreviewProvider {
    static var previews: some View {
        UserCellView()
            .preferredColorScheme(.light)
            .previewInterfaceOrientation(.portrait)
            .previewLayout(PreviewLayout.sizeThatFits)
    }
}
