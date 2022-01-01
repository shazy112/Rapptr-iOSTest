//
//  Extension + UIViewController.swift
//  Rapptr iOS Test
//
//  Created by Sheearz Ahmed on 12/31/21.
//

import Foundation
import UIKit

extension UIViewController {
    
    //create Alert VC
    func createAlert(title: String, message: String = "", completion: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction((UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: { action in
            if let completion = completion {
                completion()
            }
        })))
        self.present(alert, animated: true, completion: nil)
    }
    
    /// returns height of statusbar + navigation bar
    var topBarHeight: CGFloat {
        var top = self.navigationController?.navigationBar.frame.height ?? 0.0
        if #available(iOS 13.0, *) {
            top += UIApplication.shared.windows.first?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
        } else {
            top += UIApplication.shared.statusBarFrame.height
        }
        return top
    }
}
