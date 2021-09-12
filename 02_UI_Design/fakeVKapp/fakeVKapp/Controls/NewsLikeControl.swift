//
//  LikeControl.swift
//  fakeVKapp
//
//  Created by Evgeny Alekseev on 12.09.2021.
//

import UIKit

class NewsLikeControl: UIButton {
    
    // MARK: Private properties
    
    private var heartIcon = UIImageView()
    private var likeCounter = UILabel()
    private var isLiked = false
    private var counter = 0
    
    // MARK: Private methods
    
    private func setupView() {
        addSubview(heartIcon)
        heartIcon.image = UIImage(systemName: "heart")
        heartIcon.tintColor = .systemGray
        
        // action on tap
        self.addTarget(self, action: #selector(onTap), for: .touchUpInside)
        
        updateLikesCounter()
    }
    
    private func updateLikesCounter() {
        addSubview(likeCounter)
        likeCounter.text = String(counter)
        likeCounter.font = UIFont.systemFont(ofSize: 14)
        likeCounter.translatesAutoresizingMaskIntoConstraints = false
        likeCounter.trailingAnchor.constraint(
            equalTo: heartIcon.trailingAnchor,
            constant: self.frame.width / 2).isActive = true
        likeCounter.centerYAnchor.constraint(
            equalTo: heartIcon.centerYAnchor).isActive = true
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

