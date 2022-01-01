//
//  MenuNavigationController.swift
//  Rapptr iOS Test
//
//  Created by Sheearz Ahmed on 12/31/21.
//

import Foundation
import UIKit

class MenuNavigationController: UINavigationController {
    //getting Top VC from navigation controller to set preferredStatusBarStyle in the baseVC because preferredStatusBarStyle does not set directly if the VC is embeded in a navigation controller
    override open var childForStatusBarStyle: UIViewController? {
        return topViewController
    }
}
