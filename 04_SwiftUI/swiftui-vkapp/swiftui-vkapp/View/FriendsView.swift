//
//  FriendsView.swift
//  swiftui-vkapp
//
//  Created by Evgeny Alekseev on 31.01.2022.
//

import SwiftUI

struct FriendsView: View {
    @State var groupedArray: [String: [String]] = [:]
    var inputArray = friends.map { $0.name }
    
    var body: some View {
        List {
            ForEach(groupedArray.keys.sorted(), id: \.self) { key in
                Section(header: Text(key)) {
                    ForEach(groupedArray[key]!, id: \.self) { value in
                        NavigationLink {
                            FriendsPhotosView(friends.first(where: { $0.name == value })!)
                        } label: {
                            UserCellView(friends.first(where: { $0.name == value })!)
                        }
                        .navigationTitle("Friends")
                    }
                }
            }
        }
        .onAppear {
            groupedArray = Dictionary(
                grouping: inputArray,
                by: { $0.first?.uppercased() ?? "" }
            ).mapValues { $0.sorted() }
            
        }
    }
}

struct FriendsView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsView()
    }
}
