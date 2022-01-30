//
//  UserCellView.swift
//  swiftui-vkapp
//
//  Created by Evgeny Alekseev on 28.01.2022.
//

import SwiftUI

struct UserCellView: View {
    var name: String = "Rick Sanchez"
    var origin: String = "Dimension C-137"
    var avatar: String = "default-avatar"
    
    var body: some View {
        
        HStack {
            
            Image(avatar)
                .resizable()
                .clipShape(Circle())
                .frame(maxWidth: 50.0,
                       maxHeight: 50.0)
                .overlay(Circle().stroke(.white, lineWidth: 0.3))
                .shadow(radius: 2.0)
            
            
            VStack(alignment: .leading) {
                Text(name)
                Text(origin)
                    .font(.caption2)
            }
            Spacer()
        }
        .frame(height: 60.0)
        .offset(x: 10.0, y: 0.0)
        
    }
}

// MARK: - Preview
struct UserCellView_Previews: PreviewProvider {
    static var previews: some View {
        UserCellView()
            .preferredColorScheme(.light)
            .previewInterfaceOrientation(.portrait)
    }
}
