//
//  NewsTableViewCell.swift
//  fakeVKapp
//
//  Created by Evgeny Alekseev on 12.09.2021.
//

import UIKit
import Nuke

class NewsTableViewCell: UITableViewCell {
    
    @IBOutlet var newsTextLabel: UILabel!
    @IBOutlet var newsImageView: TrueScalePhotoImageView!
    
    func configure(with news: News) {
        
        newsTextLabel.text = news.text
        Nuke.loadImage(with: news.attachmentPhotoUrl, into: newsImageView)
        
        // cell style
        newsTextLabel.sizeToFit()
        newsTextLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        newsTextLabel.numberOfLines = 0
        
        self.selectionStyle = .none
        
    }
}
