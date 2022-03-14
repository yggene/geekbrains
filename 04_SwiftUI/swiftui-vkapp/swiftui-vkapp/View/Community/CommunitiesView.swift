//
//  FriendsView.swift
//  swiftui-vkapp
//
//  Created by Evgeny Alekseev on 31.01.2022.
//

import SwiftUI

struct CommunitiesView: View {
    
    @ObservedObject var viewModel: CommunitiesViewModel
    
    var body: some View {
        List(viewModel.communities) {
            CommunityCellView($0)
        }
        .navigationBarTitle("Communities")
    }
}


//struct CommunitiesView_Previews: PreviewProvider {
//    static var previews: some View {
//        let viewModel = CommunitiesViewModel()
//        NavigationView {
//            CommunitiesView(viewModel: viewModel)
//        }
//    }
//}
