//
//  ContentView.swift
//  swiftui-vkapp
//
//  Created by Evgeny Alekseev on 31.01.2022.
//

import SwiftUI

struct ContentView: View {
    @State var shouldShowFriendsView: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                LoginView(isLoggedIn: $shouldShowFriendsView)
                NavigationLink(isActive: $shouldShowFriendsView) {
                    FriendsView()
                } label: {
                    EmptyView()
                }
            }.navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
