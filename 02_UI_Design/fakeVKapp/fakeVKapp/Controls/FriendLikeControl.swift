//
//  LikeControl.swift
//  fakeVKapp
//
//  Created by Evgeny Alekseev on 05.09.2021.
//

import UIKit

class FriendLikeControl: UIButton {
    
    // MARK: Private properties
    
    private var heartIcon = UIImageView()
    private var likeCounter = UILabel()
    private var isLiked = false
    private var counter = 0
    
    // MARK: Private methods
    
    private func setupView() {
        addSubview(heartIcon)
        heartIcon.image = UIImage(systemName: "heart")
        heartIcon.tintColor = .systemRed
        heartIcon.heightAnchor.constraint(equalTo: self.widthAnchor,
                                          multiplier: 4.0/3.0).isActive = true
        
        // action on tap
        self.addTarget(self, action: #selector(onTap), for: .touchUpInside)
        
        updateLikesCounter()
    }
    
    private func updateLikesCounter() {
        addSubview(likeCounter)
        likeCounter.text = String(counter)
        likeCounter.translatesAutoresizingMaskIntoConstraints = false
        likeCounter.trailingAnchor.constraint(
            equalTo: heartIcon.trailingAnchor,
            constant: self.frame.width / 1.5).isActive = true
        likeCounter.centerYAnchor.constraint(
            equalTo: heartIcon.centerYAnchor).isActive = true
        likeCounter.widthAnchor.constraint(equalToConstant: self.frame.width / 2.0).isActive = true
        
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
        updateLikesCounter()
    }
    
    // MARK: Actions
    
    @objc func onTap() {
        isLiked = !isLiked
        if !isLiked {
            counter -= 1
            heartIcon.image = UIImage(systemName: "heart")
        } else {
            counter += 1
            heartIcon.image = UIImage(systemName: "heart.fill")
        }
        animation()
    }
    
    // MARK: Lifecycle
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setupView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        heartIcon.frame = bounds
    }
    
}

