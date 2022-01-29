//
//  ViewBuilders.swift
//  swiftui-vkapp
//
//  Created by Evgeny Alekseev on 29.01.2022.
//

import SwiftUI

struct UserAvatarView<Content: View>: View {
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
            content
//                .resizable()
                .clipShape(Circle())
                .frame(maxWidth: 50.0,
                       maxHeight: 50.0)
                .overlay(Circle().stroke(.white, lineWidth: 0.3))
                .shadow(radius: 2.0)
    }
}
