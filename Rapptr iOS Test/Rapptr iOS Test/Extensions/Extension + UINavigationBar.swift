//
//  Extension + UINavigationBar.swift
//  Rapptr iOS Test
//
//  Created by Sheearz Ahmed on 12/31/21.
//

import Foundation
import UIKit

extension UINavigationBar {
    
    //setting up naviagation bar across the APP
    static func setupNavigationBar() {
        let headerFont: UIFont = .headerText
        UINavigationBar.appearance().barTintColor = .headerBackgroundColor
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white,
                                                            NSAttributedString.Key.font: headerFont]
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().tintColor = .white
        if #available(iOS 15, *) {
            let navigationBarAppearance = UINavigationBarAppearance()
            navigationBarAppearance.backgroundColor = .headerBackgroundColor
            navigationBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white,
                                                           .font: headerFont]
            UINavigationBar.appearance().standardAppearance = navigationBarAppearance
            UINavigationBar.appearance().compactAppearance = navigationBarAppearance
            UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
        }
    }
}
