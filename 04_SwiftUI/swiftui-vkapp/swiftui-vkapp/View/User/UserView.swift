//
//  UserView.swift
//  swiftui-vkapp
//
//  Created by Evgeny Alekseev on 31.01.2022.
//

import SwiftUI
import Kingfisher

struct UserView: View {
    
    @ObservedObject var viewModel: UsersViewModel
    @State var groupedArray: [String: [String]] = [:]
    
    init(viewModel: UsersViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        let inputArray = viewModel.users.map { $0.name }
        
        List {
            ForEach(groupedArray.keys.sorted(), id: \.self) { key in
                Section(header: Text(key)) {
                    ForEach(groupedArray[key]!, id: \.self) { value in
                        NavigationLink {
                            UserProfileView(viewModel.users.first(where: { $0.name == value })!)
                        } label: {
                            UserCellView(viewModel.users.first(where: { $0.name == value })!)
                        }
                        .navigationTitle("Friends")
                    }
                }
            }
        }
        .onAppear {
            viewModel.fetchFriends()
            groupedArray = Dictionary(
                grouping: inputArray,
                by: { $0.first?.uppercased() ?? "" }
            ).mapValues { $0.sorted() }
        }
    }
}

//struct list_Previews: PreviewProvider {
//    static var previews: some View {
//        UserView()
//    }
//}
