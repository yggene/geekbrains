//
//  FriendsView.swift
//  swiftui-vkapp
//
//  Created by Evgeny Alekseev on 31.01.2022.
//

import SwiftUI

struct CommunitiesView: View {
    
    var body: some View {
        List(communities) {
            CommunityCellView($0)
        }.navigationTitle("Communities")
    }
}


struct CommunitiesView_Previews: PreviewProvider {
    static var previews: some View {
        CommunitiesView()
    }
}
