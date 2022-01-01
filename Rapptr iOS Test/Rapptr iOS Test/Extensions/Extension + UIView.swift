//
//  Extension + UIView.swift
//  Rapptr iOS Test
//
//  Created by Sheearz Ahmed on 12/31/21.
//

import Foundation
import UIKit

extension UIView {
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    func makeRound() {
        self.layer.cornerRadius = self.frame.height/2
        self.layer.masksToBounds = true
    }
    
    func fadeIn(_ duration: TimeInterval = 0.2, delay: TimeInterval = 0.0, completion: @escaping ((Bool) -> Void) = {(finished: Bool) -> Void in}) {
        UIView.animate(withDuration: duration, delay: delay, options: UIView.AnimationOptions.curveEaseIn, animations: {
            self.alpha = 1.0
        }, completion: completion)
    }
    
    func fadeOut(_ duration: TimeInterval = 0.2, delay: TimeInterval = 0.2, completion: @escaping (Bool) -> Void = {(finished: Bool) -> Void in}) {
        UIView.animate(withDuration: duration, delay: delay, options: UIView.AnimationOptions.curveEaseIn, animations: {
            self.alpha = 0.3
        }, completion: completion)
    }
    
    func startActivityIndicator() {
        let activityIndicatory = UIActivityIndicatorView()
        activityIndicatory.tag = 999
        self.addSubview(activityIndicatory)
        activityIndicatory.translatesAutoresizingMaskIntoConstraints = false
        activityIndicatory.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        activityIndicatory.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        activityIndicatory.heightAnchor.constraint(equalToConstant: 25).isActive = true
        activityIndicatory.widthAnchor.constraint(equalToConstant: 25).isActive = true
        activityIndicatory.startAnimating()
    }
    
    func stopActivityIndicator() {
        if let activityIndicatory = self.viewWithTag(999) as? UIActivityIndicatorView {
            activityIndicatory.stopAnimating()
            activityIndicatory.removeFromSuperview()
        }
    }
}
