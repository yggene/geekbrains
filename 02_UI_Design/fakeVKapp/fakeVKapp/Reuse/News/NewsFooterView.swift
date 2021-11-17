//
//  NewsFooterView.swift
//  fakeVKapp
//
//  Created by Evgeny Alekseev on 11.11.2021.
//

import UIKit
import SwiftUI

class NewsFooterView: UITableViewHeaderFooterView {
    
    private var likeView = UIView()
    private var likeIcon = UIImageView()
    private var likeCount = UILabel()
    
    private var commentView = UIView()
    private var commentIcon = UIImageView()
    private var commentCount = UILabel()
    
    private var shareView = UIView()
    private var shareIcon = UIImageView()
    private var shareCount = UILabel()
    
    private var seenView = UIView()
    private var seenIcon = UIImageView()
    private var seenCount = UILabel()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
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
            likeView.widthAnchor.constraint(equalToConstant: 50.0),
            likeView.heightAnchor.constraint(equalToConstant: 20.0),
            
            likeIcon.leadingAnchor.constraint(equalTo: likeView.leadingAnchor, constant: 0.0),
            likeIcon.topAnchor.constraint(equalTo: likeView.topAnchor),
            likeIcon.heightAnchor.constraint(equalToConstant: 20.0),
            likeIcon.widthAnchor.constraint(equalToConstant: 20.0),
            
            likeCount.leadingAnchor.constraint(equalTo: likeIcon.trailingAnchor, constant: 5.0),
            likeCount.topAnchor.constraint(equalTo: likeView.topAnchor),

            commentView.leadingAnchor.constraint(equalTo: likeView.trailingAnchor, constant: 10.0),
            commentView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10.0),
            commentView.widthAnchor.constraint(equalToConstant: 50.0),
            commentView.heightAnchor.constraint(equalToConstant: 30.0),
            
            commentIcon.leadingAnchor.constraint(equalTo: commentView.leadingAnchor, constant: 0.0),
            commentIcon.topAnchor.constraint(equalTo: commentView.topAnchor),
            commentIcon.heightAnchor.constraint(equalToConstant: 20.0),
            commentIcon.widthAnchor.constraint(equalToConstant: 20.0),
            
            commentCount.leadingAnchor.constraint(equalTo: commentIcon.trailingAnchor, constant: 5.0),
            commentCount.topAnchor.constraint(equalTo: commentView.topAnchor),

            shareView.leadingAnchor.constraint(equalTo: commentView.trailingAnchor, constant: 10.0),
            shareView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10.0),
            shareView.widthAnchor.constraint(equalToConstant: 50.0),
            shareView.heightAnchor.constraint(equalToConstant: 30.0),
            
            shareIcon.leadingAnchor.constraint(equalTo: shareView.leadingAnchor, constant: 0.0),
            shareIcon.topAnchor.constraint(equalTo: shareView.topAnchor),
            shareIcon.heightAnchor.constraint(equalToConstant: 20.0),
            shareIcon.widthAnchor.constraint(equalToConstant: 20.0),
            
            shareCount.leadingAnchor.constraint(equalTo: shareIcon.trailingAnchor, constant: 5.0),
            shareCount.topAnchor.constraint(equalTo: shareView.topAnchor),

            seenView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20.0),
            seenView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10.0),
            seenView.widthAnchor.constraint(equalToConstant: 50.0),
            seenView.heightAnchor.constraint(equalTo: shareView.widthAnchor, multiplier: 1.0/2.0),
            
            seenIcon.trailingAnchor.constraint(equalTo: seenView.trailingAnchor, constant: -10.0),
            seenIcon.topAnchor.constraint(equalTo: seenView.topAnchor),
            seenIcon.heightAnchor.constraint(equalToConstant: 20.0),
            seenIcon.widthAnchor.constraint(equalToConstant: 20.0),
            
            seenCount.trailingAnchor.constraint(equalTo: seenIcon.leadingAnchor, constant: -5.0),
            seenCount.topAnchor.constraint(equalTo: seenView.topAnchor),
            
        ])
        
        contentView.backgroundColor = .lightGray
        
        likeIcon.image = UIImage(systemName: "heart")
        likeCount.text = String(news.likes?.count ?? 0)
        likeCount.font = UIFont.systemFont(ofSize: 15.0)
        
        commentIcon.image = UIImage(systemName: "bubble.left")
        commentCount.text = String(news.comments?.count ?? 0)
        commentCount.font = UIFont.systemFont(ofSize: 15.0)
        
        shareIcon.image = UIImage(systemName: "arrowshape.turn.up.right")
        shareCount.text = String(news.reposts?.count ?? 0)
        shareCount.font = UIFont.systemFont(ofSize: 15.0)
        
        seenIcon.image = UIImage(systemName: "eye")
        seenCount.text = String(news.views?.count ?? 0)
        seenCount.font = UIFont.systemFont(ofSize: 15.0)
        
    }
    
}
