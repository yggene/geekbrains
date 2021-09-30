//
//  LoadingViewController.swift
//  fakeVKapp
//
//  Created by Evgeny Alekseev on 15.09.2021.
//

import UIKit

@IBDesignable
class LoadingViewController: UIViewController {
    
    @IBOutlet var firstLabel: UILabel!
    @IBOutlet var secondLabel: UILabel!
    
    @IBOutlet var dotsAnimationView: UIView!
    @IBOutlet var firstDotView: UIImageView!
    @IBOutlet var secondDotView: UIImageView!
    @IBOutlet var thirdDotView: UIImageView!
    
    @IBOutlet var cloudAnimationView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstLabel.text = "Awesome Dots Animation"
        secondLabel.text = "Amazing Cloud Animation"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        dotsAnimation()
        cloudAnimation()
    }
    
    private func dotsAnimation() {
        UIView.animate(
            withDuration: 0.4,
            delay: 0.0,
            options: [.repeat,
                      .autoreverse,
                      .curveEaseInOut]) {
            self.firstDotView.alpha = 0
        } completion: { _ in
            self.firstDotView.alpha = 1
        }
        
        UIView.animate(
            withDuration: 0.4,
            delay: 0.2,
            options: [.repeat,
                      .autoreverse,
                      .curveEaseInOut]) {
            self.secondDotView.alpha = 0
        } completion: { _ in
            self.secondDotView.alpha = 1
        }
        
        UIView.animate(
            withDuration: 0.4,
            delay: 0.4,
            options: [.repeat,
                      .autoreverse,
                      .curveEaseInOut]) {
            self.thirdDotView.alpha = 0
        } completion: { _ in
            self.thirdDotView.alpha = 1
        }
        
    }
    
    private func cloudAnimation() {
        
        let cloudPath = UIBezierPath()
        // initial point
        cloudPath.move(to: CGPoint(x: 20, y: 60))
        // second point
        cloudPath.addQuadCurve(
            to: CGPoint(x: 30, y: 40),
            controlPoint: CGPoint(x: 15, y: 45))
        // third point
        cloudPath.addQuadCurve(
            to: CGPoint(x: 50, y: 20),
            controlPoint: CGPoint(x: 30, y: 20))
        // fourth point
        cloudPath.addQuadCurve(
            to: CGPoint(x: 80, y: 20),
            controlPoint: CGPoint(x: 65, y: 0))
        // fifth point
        cloudPath.addQuadCurve(
            to: CGPoint(x: 100, y: 30),
            controlPoint: CGPoint(x: 95, y: 15))
        // sixth point
        cloudPath.addQuadCurve(
            to: CGPoint(x: 120, y: 45),
            controlPoint: CGPoint(x: 120, y: 25))
        // seventh point
        cloudPath.addQuadCurve(
            to: CGPoint(x: 115, y: 60),
            controlPoint: CGPoint(x: 130, y: 55))
        // eigth point
        cloudPath.addQuadCurve(
            to: CGPoint(x: 90, y: 65),
            controlPoint: CGPoint(x: 105, y: 75))
        // ninth point
        cloudPath.addQuadCurve(
            to: CGPoint(x: 50, y: 65),
            controlPoint: CGPoint(x: 70, y: 75))
        // tenth point
        cloudPath.addQuadCurve(
            to: CGPoint(x: 20, y: 60),
            controlPoint: CGPoint(x: 30, y: 75))
        cloudPath.close()
        
        // painting cloud
        let cloudView = CAShapeLayer()
        cloudView.path = cloudPath.cgPath
        cloudView.strokeColor = UIColor.systemTeal.cgColor
        cloudView.lineWidth = 7
        cloudView.fillColor = .none
        cloudView.lineCap = .round
        
        // animatioin start
        let pathAnimationStart = CABasicAnimation(keyPath: "strokeStart")
        pathAnimationStart.beginTime = 1.5
        pathAnimationStart.fromValue = 0
        pathAnimationStart.toValue = 1
        pathAnimationStart.duration = 1.5
        
        // animation end
        let pathAnimationEnd = CABasicAnimation(keyPath: "strokeEnd")
        pathAnimationEnd.fromValue = 0
        pathAnimationEnd.toValue = 1
        pathAnimationEnd.duration = 1.5
        
        // grouping both animations
        let animationGroup = CAAnimationGroup()
        animationGroup.duration = 3.0
        animationGroup.animations = [pathAnimationEnd, pathAnimationStart]
        animationGroup.repeatCount = .infinity
        cloudView.add(animationGroup, forKey: nil)
        
        // adding cloud to the view
        cloudAnimationView.layer.addSublayer(cloudView)
        
    }
    
    
    
}
