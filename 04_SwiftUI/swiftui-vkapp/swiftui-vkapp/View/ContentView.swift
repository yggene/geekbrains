//
//  ContentView.swift
//  swiftui-vkapp
//
//  Created by Evgeny Alekseev on 31.01.2022.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            FriendsView()
                //.navigationTitle("Wow")
                .tabItem {
                    Image(systemName: "person")
                    Text("Friends")
                }
            
            CommunitiesView()
                //.navigationTitle("Communities")
                .tabItem {
                    Image(systemName: "star")
                    Text("Communities")
                }
            NewsView()
                //.navigationTitle("Communities")
                .tabItem {
                    Image(systemName: "moon")
                    Text("News")
                }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
