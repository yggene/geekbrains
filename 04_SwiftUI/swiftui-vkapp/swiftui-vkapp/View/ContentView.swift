//
//  ContentView.swift
//  swiftui-vkapp
//
//  Created by Evgeny Alekseev on 31.01.2022.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var userViewModel = UsersViewModel()
    @ObservedObject var communityViewModel = CommunitiesViewModel()
    @ObservedObject var newsViewModel = NewsViewModel()
    
    let networkService = NetworkService()
    
    var body: some View {
        TabView {
            NavigationView {
                UserView()
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
                    Text("Communities")
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
