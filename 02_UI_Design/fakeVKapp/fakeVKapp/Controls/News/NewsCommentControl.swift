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
    var totalComments = 0
    
    // MARK: Private methods
    
    override init(frame: CGRect) {
            super.init(frame: frame)
        }
    
    private func setupView() {
        addSubview(commentIcon)
        addSubview(commentCounter)
        
        commentIcon.translatesAutoresizingMaskIntoConstraints = false
        commentCounter.translatesAutoresizingMaskIntoConstraints = false
    
        commentIcon.image = UIImage(systemName: "bubble.left")
        commentIcon.tintColor = .systemGray
        commentIcon.frame = bounds
        
        commentCounter.text = String(totalComments)
        commentCounter.font = UIFont.systemFont(ofSize: 14)
        commentCounter.translatesAutoresizingMaskIntoConstraints = false
        commentCounter.leadingAnchor.constraint(
            equalTo: commentIcon.trailingAnchor,
            constant: self.frame.width / 6).isActive = true
        commentCounter.centerYAnchor.constraint(
            equalTo: commentIcon.centerYAnchor).isActive = true
        
        // action on tap
        self.addTarget(self, action: #selector(onTap), for: .touchUpInside)
        
    }
    
    private func updateCommentsCounter() {
        commentCounter.text = String(totalComments)
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
        updateCommentsCounter()
        animation()
    }
    
    // MARK: Lifecycle
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setupView()
    }

}
