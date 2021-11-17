//
//  NewsFooterView.swift
//  fakeVKapp
//
//  Created by Evgeny Alekseev on 11.11.2021.
//

import UIKit
import SwiftUI

class NewsFooterView: UITableViewHeaderFooterView {
    
    // MARK: Constants
    
    private let likeView = UIView()
    private let likeIcon = UIImageView()
    private let likeCount = UILabel()
    
    private let commentView = UIView()
    private let commentIcon = UIImageView()
    private let commentCount = UILabel()
    
    private let shareView = UIView()
    private let shareIcon = UIImageView()
    private let shareCount = UILabel()
    
    private let seenView = UIView()
    private let seenIcon = UIImageView()
    private let seenCount = UILabel()
    
    private let footerTextHeight = 20.0
    private let footerTextFont = UIFont.systemFont(ofSize: 14.0)
    private let buttonBGColor = UIColor(rgb: 0xF4F5F6)
    private let footerViewCornerRadius = 13.0
    private let footerViewHeight = 30.0
    
    // MARK: Init
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    // MARK: Configure method
    
    func configure(with news: News) {
        
        likeView.addSubview(likeIcon)
        likeView.addSubview(likeCount)

        commentView.addSubview(commentIcon)
        commentView.addSubview(commentCount)

        shareView.addSubview(shareIcon)
        shareView.addSubview(shareCount)

        seenView.addSubview(seenIcon)
        seenView.addSubview(seenCount)
        
        contentView.addSubview(likeView)
        contentView.addSubview(commentView)
        contentView.addSubview(shareView)
        contentView.addSubview(seenView)
        
        likeView.translatesAutoresizingMaskIntoConstraints = false
        likeIcon.translatesAutoresizingMaskIntoConstraints = false
        likeCount.translatesAutoresizingMaskIntoConstraints = false

        commentView.translatesAutoresizingMaskIntoConstraints = false
        commentIcon.translatesAutoresizingMaskIntoConstraints = false
        commentCount.translatesAutoresizingMaskIntoConstraints = false

        shareView.translatesAutoresizingMaskIntoConstraints = false
        shareIcon.translatesAutoresizingMaskIntoConstraints = false
        shareCount.translatesAutoresizingMaskIntoConstraints = false

        seenView.translatesAutoresizingMaskIntoConstraints = false
        seenIcon.translatesAutoresizingMaskIntoConstraints = false
        seenCount.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            likeView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10.0),
            likeView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10.0),
            likeView.widthAnchor.constraint(greaterThanOrEqualToConstant: 50.0),
            likeView.heightAnchor.constraint(equalToConstant: 30.0),
            
            likeIcon.leadingAnchor.constraint(equalTo: likeView.leadingAnchor, constant: 10.0),
            likeIcon.widthAnchor.constraint(equalToConstant: 23.0),
            likeIcon.heightAnchor.constraint(equalToConstant: 20.0),
            likeIcon.centerYAnchor.constraint(equalTo: likeView.centerYAnchor),
            
            likeCount.leadingAnchor.constraint(equalTo: likeIcon.trailingAnchor, constant: 5.0),
            likeCount.trailingAnchor.constraint(equalTo: likeView.trailingAnchor, constant: -10.0),
            likeCount.centerYAnchor.constraint(equalTo: likeView.centerYAnchor),

            commentView.leadingAnchor.constraint(equalTo: likeView.trailingAnchor, constant: 15.0),
            commentView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10.0),
            commentView.widthAnchor.constraint(greaterThanOrEqualToConstant: 50.0),
            commentView.heightAnchor.constraint(equalToConstant: 30.0),
            
            commentIcon.leadingAnchor.constraint(equalTo: commentView.leadingAnchor, constant: 10.0),
            commentIcon.widthAnchor.constraint(equalToConstant: 23.0),
            commentIcon.heightAnchor.constraint(equalToConstant: 20.0),
            commentIcon.centerYAnchor.constraint(equalTo: commentView.centerYAnchor),

            commentCount.leadingAnchor.constraint(equalTo: commentIcon.trailingAnchor, constant: 5.0),
            commentCount.trailingAnchor.constraint(equalTo: commentView.trailingAnchor, constant: -10.0),
            commentCount.centerYAnchor.constraint(equalTo: commentView.centerYAnchor),

            shareView.leadingAnchor.constraint(equalTo: commentView.trailingAnchor, constant: 15.0),
            shareView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10.0),
            shareView.widthAnchor.constraint(greaterThanOrEqualToConstant: 50.0),
            shareView.heightAnchor.constraint(equalToConstant: 30.0),
            
            shareIcon.leadingAnchor.constraint(equalTo: shareView.leadingAnchor, constant: 10.0),
            shareIcon.widthAnchor.constraint(equalToConstant: 23.0),
            shareIcon.heightAnchor.constraint(equalToConstant: 20.0),
            shareIcon.centerYAnchor.constraint(equalTo: shareView.centerYAnchor),
            
            shareCount.leadingAnchor.constraint(equalTo: shareIcon.trailingAnchor, constant: 5.0),
            shareCount.trailingAnchor.constraint(equalTo: shareView.trailingAnchor, constant: -10.0),
            shareCount.centerYAnchor.constraint(equalTo: shareView.centerYAnchor),

            seenView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20.0),
            seenView.centerYAnchor.constraint(equalTo: likeView.centerYAnchor),
            seenView.widthAnchor.constraint(greaterThanOrEqualToConstant: 50.0),
            seenView.heightAnchor.constraint(equalTo: shareView.widthAnchor, multiplier: 30.0),
            
            seenIcon.trailingAnchor.constraint(equalTo: seenCount.leadingAnchor, constant: -5.0),
            seenIcon.widthAnchor.constraint(equalToConstant: 20.0),
            seenIcon.heightAnchor.constraint(equalToConstant: 17.0),
            seenIcon.centerYAnchor.constraint(equalTo: seenView.centerYAnchor),
            
            seenCount.trailingAnchor.constraint(equalTo: seenView.trailingAnchor, constant: -5.0),
            seenCount.centerYAnchor.constraint(equalTo: seenView.centerYAnchor),
            
        ])
        
        likeView.backgroundColor = buttonBGColor
        likeView.layer.cornerRadius = footerViewCornerRadius
        likeView.layer.masksToBounds = true
        
        commentView.backgroundColor = buttonBGColor
        commentView.layer.cornerRadius = footerViewCornerRadius
        commentView.layer.masksToBounds = true
        
        shareView.backgroundColor = buttonBGColor
        shareView.layer.cornerRadius = footerViewCornerRadius
        shareView.layer.masksToBounds = true
        
        likeIcon.image = UIImage(systemName: "heart")
        likeCount.text = String(news.likes?.count ?? 0)
        likeCount.font = footerTextFont
        
        commentIcon.image = UIImage(systemName: "bubble.left")
        commentCount.text = String(news.comments?.count ?? 0)
        commentCount.font = footerTextFont
        
        shareIcon.image = UIImage(systemName: "arrowshape.turn.up.right")
        shareCount.text = String(news.reposts?.count ?? 0)
        shareCount.font = footerTextFont
        
        seenIcon.image = UIImage(systemName: "eye")
        seenCount.text = String(news.views?.count ?? 0)
        seenCount.font = footerTextFont
        
    }
    
}
