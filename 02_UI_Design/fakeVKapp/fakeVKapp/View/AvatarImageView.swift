//
//  AvatarImageView.swift
//  fakeVKapp
//
//  Created by Evgeny Alekseev on 03.09.2021.
//

import UIKit

class AvatarImage: UIImageView {
    
    let borderColor: UIColor = .darkGray
    let borderWidth: CGFloat = 0.1
    
    override func awakeFromNib() {
        self.layer.cornerRadius = self.frame.height / 2
        self.layer.masksToBounds = true
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
    }
}

class AvatarShadow: UIView {
    // how long the shadow will be. The longer the shadow, the more blurred it will be
    @IBInspectable var shadowRadius: CGFloat = 2.0
    // the color of the shadow
    @IBInspectable var shadowColor: UIColor = .darkGray
    // opacity of the shadow
    @IBInspectable var shadowOpacity: Float = 0.7
    // negative value will place it on left / above of the image view
    @IBInspectable var shadowOffset: CGSize = CGSize(width: 1.0, height: 1.0)
    
    override func awakeFromNib() {
        
        self.layer.shadowRadius = shadowRadius
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowOffset = shadowOffset
        self.backgroundColor = .clear
        
        tapOnView()
    }
    
    func tapOnView() {
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(onTap))
        recognizer.numberOfTapsRequired = 1
        self.addGestureRecognizer(recognizer)
    }
    
    @objc func onTap(gestureRecognizer: UITapGestureRecognizer) {
        UIView.animate(withDuration: 0.1,
                       delay: 0,
                       usingSpringWithDamping: 1.0,
                       initialSpringVelocity: 0.1,
                       animations: {
                        self.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
                       }, completion: { _ in
                        self.transform = .identity
                       })
    }
    
}
