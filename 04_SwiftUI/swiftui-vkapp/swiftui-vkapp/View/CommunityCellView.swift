//
//  CommunityCellView.swift
//  swiftui-vkapp
//
//  Created by Evgeny Alekseev on 28.01.2022.
//

import SwiftUI

struct ComminityCellView: View {
    var communityName: String = "Dimension C-137"
    var communityImage: String = "dimension-c137"
    var communityInfo: String = "Community, 7.9 billion members"
    
    var body: some View {
        HStack {
            Image("dimension-c137")
                .resizable()
                .frame(width: 75.0, height: 50)
            
            VStack(alignment: .leading) {
                Text(communityName)
                Text(communityInfo)
                    .font(.caption2)
            }
            
            Spacer()
        }
        .offset(x: 10.0, y: 0.0)
    }
}

// MARK: - Preview
struct ComminityCellView_Previews: PreviewProvider {
    static var previews: some View {
        ComminityCellView()
            .preferredColorScheme(.light)
            .previewInterfaceOrientation(.portrait)
    }
}
