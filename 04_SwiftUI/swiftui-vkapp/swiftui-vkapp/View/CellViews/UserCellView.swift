//
//  UserCellView.swift
//  swiftui-vkapp
//
//  Created by Evgeny Alekseev on 28.01.2022.
//

import SwiftUI

struct UserCellView: View {
    var name: String
    var origin: String
    var avatar: String
    
    init(_ friend: Friend) {
        self.name = friend.name
        self.origin = friend.origin
        self.avatar = friend.avatar
    }
    
    // default init
    init() {
        self.name = "Random name"
        self.origin = "Random origin"
        self.avatar = "default-avatar"
    }
    
    var body: some View {
        HStack {
            Image(avatar)
                .resizable()
                .clipShape(Circle())
                .frame(maxWidth: 50.0,
                       maxHeight: 50.0)
                .overlay(Circle().stroke(.white, lineWidth: 0.3))
                .shadow(radius: 2.0)
            VStack(alignment: .leading) {
                Text(name)
                Text(origin)
                    .font(.caption2)
            }
            Spacer()
        }
    }
}

// MARK: - Preview
struct UserCellView_Previews: PreviewProvider {
    static var previews: some View {
        UserCellView()
            .preferredColorScheme(.light)
            .previewInterfaceOrientation(.portrait)
    }
}
