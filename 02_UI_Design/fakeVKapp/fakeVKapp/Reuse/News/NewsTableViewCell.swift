//
//  NewsTableViewCell.swift
//  fakeVKapp
//
//  Created by Evgeny Alekseev on 12.09.2021.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    @IBOutlet var authorAvatarImageView: AvatarImage!
    @IBOutlet var authorNameLabel: UILabel!
    @IBOutlet var postDateLabel: UILabel!
    @IBOutlet var newsTextLabel: UILabel!
    @IBOutlet var newsImageView: UIImageView?
    @IBOutlet var likesControl: NewsLikeControl!
    @IBOutlet var commentsControl: NewsCommentControl!
    @IBOutlet var sharesControl: NewsShareControl!
    @IBOutlet var seenLabel: UILabel!
    
    func configure(with news: News) {
        
//        guard let currentFriend = friends.filter({ $0.id == news.authorID }).first else { return }
//        
//        authorAvatarImageView.image = randomAvatar() //currentFriend.avatar.image
//        authorNameLabel.text = currentFriend.firstName + " " + currentFriend.lastName
//        postDateLabel.text = news.postDate
//        newsTextLabel.text = news.text
//        newsImageView?.image = news.photo?.image
//        self.likesControl.likesTotal = news.likesCount
//        self.commentsControl.totalComments = news.commentsCount
//        self.sharesControl.sharesTotal = news.sharesCount
//        seenLabel.text = String(news.viewCount)
//        
//        // cell style
//        postDateLabel.textColor = UIColor.systemGray
//        newsTextLabel.sizeToFit()
//        newsTextLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
//        newsTextLabel.numberOfLines = 0
//        
//        self.selectionStyle = .none
        
    }
}
