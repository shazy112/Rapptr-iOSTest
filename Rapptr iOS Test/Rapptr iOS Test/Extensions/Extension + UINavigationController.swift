//
//  Extension + UINavigationController.swift
//  Rapptr iOS Test
//
//  Created by Sheearz Ahmed on 12/31/21.
//

import Foundation
import UIKit

extension UINavigationController {
    
     //sets status bar background color
    func setStatusBar(backgroundColor: UIColor) {
        //Getting status bar frame to apply to our statusbar view.
        let statusBarFrame: CGRect
        if #available(iOS 13.0, *) {
            statusBarFrame = view.window?.windowScene?.statusBarManager?.statusBarFrame ?? CGRect.zero
        } else {
            statusBarFrame = UIApplication.shared.statusBarFrame
        }
        
        //Setting up status bar view to add a custom color to it.
        let statusBarView = UIView(frame: statusBarFrame)
        statusBarView.backgroundColor = backgroundColor
        view.addSubview(statusBarView)
    }
}
