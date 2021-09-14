//
//  LikeControl.swift
//  fakeVKapp
//
//  Created by Evgeny Alekseev on 05.09.2021.
//

import UIKit

class NewsShareControl: UIButton {
    
    // MARK: Private properties
    
    private var shareIcon = UIImageView()
    private var sharesCounterLabel = UILabel()
    private var isShared = false
    var sharesTotal = 0
    
    // MARK: Private methods
    
    private func setupView() {
        addSubview(shareIcon)
        addSubview(sharesCounterLabel)
        
        shareIcon.image = UIImage(systemName: "arrowshape.turn.up.right")
        shareIcon.tintColor = .systemGray
        shareIcon.frame = bounds
        
        sharesCounterLabel.text = String(sharesTotal)
        sharesCounterLabel.font = UIFont.systemFont(ofSize: 14)
        sharesCounterLabel.translatesAutoresizingMaskIntoConstraints = false
        sharesCounterLabel.trailingAnchor.constraint(
            equalTo: shareIcon.trailingAnchor,
            constant: self.frame.width / 2).isActive = true
        sharesCounterLabel.centerYAnchor.constraint(
            equalTo: shareIcon.centerYAnchor).isActive = true
        
        // action on tap
        self.addTarget(self, action: #selector(onTap), for: .touchUpInside)
        
    }
    
    private func updateSharesCounter() {
        sharesCounterLabel.text = String(sharesTotal)
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
        if !isShared {
            isShared = !isShared
            sharesTotal += 1
            shareIcon.image = UIImage(systemName: "arrowshape.turn.up.right.fill")
        }
        animation()
        updateSharesCounter()
    }
    
    // MARK: Lifecycle
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setupView()
    }
    
}

