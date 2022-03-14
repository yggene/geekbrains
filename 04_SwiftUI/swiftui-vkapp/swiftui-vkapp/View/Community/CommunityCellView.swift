//
//  CommunityCellView.swift
//  swiftui-vkapp
//
//  Created by Evgeny Alekseev on 28.01.2022.
//

import SwiftUI

struct CommunityCellView: View {
    var communityName: String
    var communityDescription: String
    var communityImage: String
    
    init(_ community: Community) {
        self.communityName = community.name
        self.communityDescription = community.description
        self.communityImage = community.photo
    }
    
    // default init
    init() {
        self.communityName = "Some community"
        self.communityDescription = "Some description"
        self.communityImage = "community-dimension-c137"
    }
    
    var body: some View {
        HStack {
            Image(communityImage)
                .resizable()
                .frame(width: 75.0, height: 50)
            VStack(alignment: .leading) {
                Text(communityName)
                Text(communityDescription)
                    .font(.caption2)
            }
        }
    }
}

// MARK: - Preview
struct CommunityCellView_Previews: PreviewProvider {
    static var previews: some View {
        CommunityCellView()
            .preferredColorScheme(.light)
            .previewInterfaceOrientation(.portrait)
            .previewLayout(PreviewLayout.sizeThatFits)
    }
}
