//
//  NewsCommentControl.swift
//  fakeVKapp
//
//  Created by Evgeny Alekseev on 12.09.2021.
//

import UIKit

class NewsCommentControl: UIButton {

    // MARK: Private properties
    
    private var commentIcon = UIImageView()
    private var commentCounter = UILabel()
    private var totalComments = 0
    
    // MARK: Private methods
    
    private func setupView() {
        addSubview(commentIcon)
        commentIcon.image = UIImage(systemName: "bubble.left")
        commentIcon.tintColor = .systemGray
        
        // action on tap
        self.addTarget(self, action: #selector(onTap), for: .touchUpInside)
        
        updateCommentsCounter()
    }
    
    private func updateCommentsCounter() {
        addSubview(commentCounter)
        commentCounter.text = String(totalComments)
        commentCounter.font = UIFont.systemFont(ofSize: 14)
        commentCounter.translatesAutoresizingMaskIntoConstraints = false
        commentCounter.trailingAnchor.constraint(
            equalTo: commentIcon.trailingAnchor,
            constant: self.frame.width / 2).isActive = true
        commentCounter.centerYAnchor.constraint(
            equalTo: commentIcon.centerYAnchor).isActive = true
    }
    
    private func animation() {
        UIView.animate(withDuration: 0.1,
                       animations: {
                        self.transform = self.transform.scaledBy(x: 1.1, y: 1.1)
                       },
                       completion: { _ in
                        UIView.animate(withDuration: 0.1, animations: {
                            self.transform = CGAffineTransform.identity
                        })
                       })
        updateCommentsCounter()
    }
    
    // MARK: Actions
    
    @objc func onTap() {
//        isLiked = !isLiked
//        if !isLiked {
//            likesCounter -= 1
//            heartIcon.image = UIImage(systemName: "heart")
//        } else {
//            likesCounter += 1
//            heartIcon.image = UIImage(systemName: "heart.fill")
//        }
        animation()
    }
    
    // MARK: Lifecycle
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setupView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        commentIcon.frame = bounds
    }

}
