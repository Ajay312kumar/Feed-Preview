//
//  Extensions.swift
//  FeedPreview
//
//  Created by IPH Technologies Pvt. Ltd.
//

import Foundation
import UIKit

extension UIView {
   
    func fadeInFromBottom(duration: TimeInterval = 0.3, delay: TimeInterval = 0.0, completion: @escaping ((Bool) -> Void) = {(finished: Bool) -> Void in}) {
        self.alpha = 0.0
        self.transform = CGAffineTransform(translationX: 0, y: self.frame.size.height)
        UIView.animate(withDuration: duration, delay: delay, options: .curveEaseIn, animations: {
            self.alpha = 1.0
            self.transform = CGAffineTransform.identity
        }, completion: completion)
    }
    
    func fadeOutToTop(duration: TimeInterval = 0.3, delay: TimeInterval = 0.0, completion: @escaping (Bool) -> Void = {(finished: Bool) -> Void in}) {
        UIView.animate(withDuration: duration, delay: delay, options: .curveEaseOut, animations: {
            self.alpha = 0.0
            self.transform = CGAffineTransform(translationX: 0, y: -self.frame.size.height)
        }, completion: completion)
    }
    
}

