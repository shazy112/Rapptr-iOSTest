//
//  PrimaryTextField.swift
//  Rapptr iOS Test
//
//  Created by Sheearz Ahmed on 12/29/21.
//

import Foundation
import UIKit
class PrimaryTextField: UITextField {
    
    let padding = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 5)
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        prepareTextField()
    }
    
    private func prepareTextField() {
        let placeholderColor: UIColor = .primaryTextFieldPlaceholderColor
        let placeholderFont: UIFont = .primaryTextFieldPlaceholder
        attributedPlaceholder = NSAttributedString(string: placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor : placeholderColor,
                                                                                           NSAttributedString.Key.font: placeholderFont])
        font = .primaryTextFieldTitle
        textColor = .primaryTextFieldTitleColor
        backgroundColor = .primaryTextfieldBackgroundColor
        layer.cornerRadius = 8
        layer.masksToBounds = true
    }
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
}
