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
            NavigationView {
                FriendsView()
            }
            .tabItem {
                Label {
                    Text("Friends")
                } icon: {
                    Image(systemName: "person")
                }
            }
            
            NavigationView {
                CommunitiesView()
            }
            .tabItem {
                Label {
                    Text("COmmunities")
                } icon: {
                    Image(systemName: "star")
                }
            }
            
            NavigationView {
                NewsView()
            }
            .tabItem {
                Label {
                    Text("News")
                } icon: {
                    Image(systemName: "cloud")
                }
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TabView {
            ContentView()
        }
    }
}
