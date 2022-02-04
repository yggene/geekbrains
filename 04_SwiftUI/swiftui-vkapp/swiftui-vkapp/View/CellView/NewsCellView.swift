//
//  NewsView.swift
//  swiftui-vkapp
//
//  Created by Evgeny Alekseev on 01.02.2022.
//

import SwiftUI

struct NewsCellView: View {
    var author: String
    var date: String
    var avatar: String
    var newsText: String
    var newsImage: String
    
    init(_ news: News) {
        self.author = news.author
        self.date = news.date
        self.avatar = news.avatar
        self.newsText = news.newsText
        self.newsImage = news.newsImage
    }
    
    init() {
        self.author = "Some Friend"
        self.date = "Some date"
        self.avatar = "default-avatar"
        self.newsText = "I am news!"
        self.newsImage = "default-avatar"
    }

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                UserAvatarView {
                Image(avatar)
                        .resizable()
                }
                VStack(alignment: .leading) {
                    Text(author)
                    Text(date)
                        .font(.caption2)
                }
            }
            VStack(alignment: .leading) {
                Text(newsText)
                Image(newsImage)
                    .resizable()
                    .scaledToFit()
            }
            HStack {
                Text("Like")
                Text("Share")
                Text("Comment")
                Spacer()
                Text("Views")
            }
        }
    }

}

// MARK: - Preview
struct NewsCellView_Previews: PreviewProvider {
    static var previews: some View {
        NewsCellView()
            .preferredColorScheme(.light)
            .previewInterfaceOrientation(.portrait)
    }
}
