//
//  LikeControl.swift
//  fakeVKapp
//
//  Created by Evgeny Alekseev on 05.09.2021.
//

import UIKit

class LikeControl: UIButton {
    
    // MARK: Private properties
    
    private var heartIcon = UIImageView()
    private var likesCounter = UILabel()
    
    private var textColor = UIColor { tc in
        switch tc.userInterfaceStyle {
        case .dark:
            return UIColor.white
        default:
            return UIColor.black
        }
    }

    private var likeCounter = 2
    private var isLiked = false
    
    // MARK: Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setupView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        heartIcon.frame = bounds
    }
    
    // MARK: Private methods
    
    private func setupView() {
        
        addSubview(heartIcon)
        addSubview(likesCounter)
        
        heartIcon.image = UIImage(systemName: "heart")
        heartIcon.tintColor = textColor
        
        likesCounter.text = String(likeCounter)
        likesCounter.tintColor = textColor
        likesCounter.translatesAutoresizingMaskIntoConstraints = false
        likesCounter.trailingAnchor.constraint(
            equalTo: heartIcon.leadingAnchor,
            constant: -5).isActive = true
        likesCounter.centerYAnchor.constraint(
            equalTo: heartIcon.centerYAnchor).isActive = true
        
        // action on tap
        self.addTarget(self, action: #selector(onTap), for: .touchUpInside)
        
    }
    
    private func animation() {
        UIView.animate(withDuration: 0.1, animations: {
            self.transform = self.transform.scaledBy(x: 1.1, y: 1.1)
        }, completion: { _ in
            UIView.animate(withDuration: 0.1, animations: {
                self.transform = CGAffineTransform.identity
            })
        })
    }
    
    // MARK: Actions
    
    @objc func onTap() {
        if isLiked {
            isLiked = !isLiked
            likeCounter -= 1
            heartIcon.image = UIImage(systemName: "heart")
            heartIcon.tintColor = textColor
            animation()
        } else {
            isLiked = !isLiked
            likeCounter += 1
            heartIcon.image = UIImage(systemName: "heart.fill")
            heartIcon.tintColor = .systemRed
            animation()
        }
    }
}
