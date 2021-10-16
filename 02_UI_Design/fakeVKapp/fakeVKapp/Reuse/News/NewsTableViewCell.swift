//
//  NewsTableViewCell.swift
//  fakeVKapp
//
//  Created by Evgeny Alekseev on 12.09.2021.
//

import UIKit
import Nuke

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
        
        //guard let currentFriend = friends.filter({ $0.id == news.authorID }).first else { return }
        
        //authorAvatarImageView.image = randomAvatar() //currentFriend.avatar.image
        //authorNameLabel.text = currentFriend.firstName + " " + currentFriend.lastName
        //postDateLabel.text = news.postDate
        newsTextLabel.text = news.text
        //Nuke.loadImage(with: news.attachments.photo.url, into: newsImageView?)
        self.likesControl.likesTotal = news.likes?.count ?? 0
        self.commentsControl.totalComments = news.comments.count
        self.sharesControl.sharesTotal = news.reposts.count
        seenLabel.text = String(news.views.count)
        
        // cell style
        postDateLabel.textColor = UIColor.systemGray
        newsTextLabel.sizeToFit()
        newsTextLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        newsTextLabel.numberOfLines = 0
        
        self.selectionStyle = .none
        
    }
}
