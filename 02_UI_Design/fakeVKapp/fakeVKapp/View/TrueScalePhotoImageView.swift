//
//  NewsPhotoImageView.swift
//  fakeVKapp
//
//  Created by Evgeny Alekseev on 12.09.2021.
//  Taken from https://stackoverflow.com/questions/26833627/with-auto-layout-how-do-i-make-a-uiimageviews-size-dynamic-depending-on-the-im
//

import UIKit

class TrueScalePhotoImageView: UIImageView {
    
    override var intrinsicContentSize: CGSize {
        
        if let myImage = self.image {
            let myImageWidth = myImage.size.width
            let myImageHeight = myImage.size.height
            let myViewWidth = self.frame.size.width
            
            let ratio = myViewWidth / myImageWidth
            let scaledHeight = myImageHeight * ratio
            
            return CGSize(width: myViewWidth, height: scaledHeight)
        }
        
        return CGSize(width: -1.0, height: -1.0)
    }
}
