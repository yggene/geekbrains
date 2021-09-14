//
//  LikeControl.swift
//  fakeVKapp
//
//  Created by Evgeny Alekseev on 12.09.2021.
//

import UIKit

class NewsLikeControl: UIButton {
    
    // MARK: Private properties
    
    private var likeIcon = UIImageView()
    private var likesCounterLabel = UILabel()
    private var isLiked = false
    var likesTotal = 0
    
    // MARK: Private methods
    
    private func setupView() {
        addSubview(likeIcon)
        addSubview(likesCounterLabel)
        
        likeIcon.image = UIImage(systemName: "heart")
        likeIcon.tintColor = .systemGray
        likeIcon.frame = bounds
        
        likesCounterLabel.text = String(likesTotal)
        likesCounterLabel.font = UIFont.systemFont(ofSize: 14)
        likesCounterLabel.translatesAutoresizingMaskIntoConstraints = false
        likesCounterLabel.leadingAnchor.constraint(
            equalTo: likeIcon.trailingAnchor,
            constant: self.frame.width / 6).isActive = true
        likesCounterLabel.centerYAnchor.constraint(
            equalTo: likeIcon.centerYAnchor).isActive = true
        
        // action on tap
        self.addTarget(self, action: #selector(onTap), for: .touchUpInside)
        
    }
    
    private func updateLikesCounter() {
        likesCounterLabel.text = String(likesTotal)
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
    }
    
    // MARK: Actions
    
    @objc func onTap() {
        isLiked = !isLiked
        if !isLiked {
            likesTotal -= 1
            likeIcon.image = UIImage(systemName: "heart")
        } else {
            likesTotal += 1
            likeIcon.image = UIImage(systemName: "heart.fill")
        }
        animation()
        updateLikesCounter()
    }
    
    // MARK: Lifecycle
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setupView()
    }
}

