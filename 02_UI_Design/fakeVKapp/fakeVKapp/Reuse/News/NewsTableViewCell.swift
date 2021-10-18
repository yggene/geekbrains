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
    @IBOutlet var newsImageView: TrueScalePhotoImageView!
    @IBOutlet var likesControl: NewsLikeControl!
    @IBOutlet var commentsControl: NewsCommentControl!
    @IBOutlet var sharesControl: NewsShareControl!
    @IBOutlet var seenLabel: UILabel!
    
    func configure(with news: News) {
        
        //authorAvatarImageView.image = randomAvatar() //currentFriend.avatar.image
        //authorNameLabel.text = currentFriend.firstName + " " + currentFriend.lastName
        postDateLabel.text = news.date.date()
        newsTextLabel.text = news.text
        Nuke.loadImage(with: news.attachmentPhotoUrl, into: newsImageView)
        likesControl.likesTotal = news.likes.count
        commentsControl.totalComments = news.comments.count
        sharesControl.sharesTotal = news.reposts.count
        seenLabel.text = String(news.views?.count ?? 0)
        
        // cell style
        postDateLabel.textColor = UIColor.systemGray
        newsTextLabel.sizeToFit()
        newsTextLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        newsTextLabel.numberOfLines = 0
        
        self.selectionStyle = .none
        
    }
}
