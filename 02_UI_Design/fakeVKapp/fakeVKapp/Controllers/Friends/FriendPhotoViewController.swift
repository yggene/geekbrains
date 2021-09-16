//
//  FriendPhotoViewController.swift
//  fakeVKapp
//
//  Created by Evgeny Alekseev on 16.09.2021.
//

import UIKit

class FriendPhotoViewController: UIViewController {
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let recognizer = UIPanGestureRecognizer(target: self, action: #selector(onPan))
        view.addGestureRecognizer(recognizer)
        
        currentPhoto.image = allPhotos[currentPhotoCounter]?.image
        
    }
    
    // MARK: Variables
    
    @IBOutlet var currentPhoto: TrueScalePhotoImageView!
    var allPhotos: [Photo?] = []
    var currentPhotoCounter = 0
    var interactiveAnimator: UIViewPropertyAnimator!
    
    // MARK: Animation
    
    @objc func onPan(_ recognizer: UIPanGestureRecognizer) {
        
        switch recognizer.state {
        case .began:
            interactiveAnimator?.startAnimation()
            interactiveAnimator = UIViewPropertyAnimator(
                duration: 0.5,
                curve: .easeInOut,
                animations: {
                    self.currentPhoto.alpha = 0.2
                    self.currentPhoto.transform = .init(scaleX: 2.0, y: 2.0)
                })
            interactiveAnimator.pauseAnimation()
            
        case .changed:
            let translation = recognizer.translation(in: self.view)
            interactiveAnimator.fractionComplete = abs(translation.x / 100)
            self.currentPhoto.transform = CGAffineTransform(translationX: translation.x, y: 0)
            
        case .ended:
            interactiveAnimator.stopAnimation(true)
            if recognizer.translation(in: self.view).x < 0 {
                if currentPhotoCounter < allPhotos.count - 1  {
                    self.currentPhotoCounter += 1
                }
            } else {
                if currentPhotoCounter != 0 {
                    self.currentPhotoCounter -= 1
                }
            }
            
            interactiveAnimator.addAnimations {
                self.currentPhoto.transform = .identity
                self.currentPhoto.alpha = 1
            }
            
            interactiveAnimator?.startAnimation()
            
        default: break
        }
        
        currentPhoto.image = allPhotos[currentPhotoCounter]?.image
        
    }
    
}
