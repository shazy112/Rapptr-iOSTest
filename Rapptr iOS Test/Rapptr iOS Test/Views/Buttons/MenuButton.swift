//
//  MenuButton.swift
//  Rapptr iOS Test
//
//  Created by Sheearz Ahmed on 12/29/21.
//

import Foundation
import UIKit

@IBDesignable
class MenuButton: UIButton {
    
    private var buttonLeftSpacing = 22.0
    
    @IBInspectable var titleText: String? {
        didSet {
            setTitle(titleText, for: .normal)
            titleEdgeInsets = UIEdgeInsets(top: 0.0, left: 0, bottom: 0.0, right: 0.0)
            titleLabel?.font = .menuButton
            setTitleColor(.menuButtonTitleColor, for: .normal)
            contentVerticalAlignment = .fill
            contentMode = .center
            backgroundColor = .menuButtonBackgroundColor
            titleEdgeInsets.left = buttonLeftSpacing + 16.0
        }
    }
    
    @IBInspectable var leftImage: UIImage? {
        didSet {
            setImage(leftImage?.withRenderingMode(.alwaysOriginal), for: .normal)
            imageEdgeInsets = UIEdgeInsets(top: 0, left: buttonLeftSpacing, bottom: 0, right: 0)
            imageView?.contentMode = .scaleAspectFit
            contentHorizontalAlignment = .left
            imageView?.contentMode = .scaleAspectFit
        }
    }
}
