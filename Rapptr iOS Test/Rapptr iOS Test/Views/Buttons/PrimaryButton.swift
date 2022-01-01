//
//  PrimaryButton.swift
//  Rapptr iOS Test
//
//  Created by Sheearz Ahmed on 12/29/21.
//

import Foundation
import UIKit
class PrimaryButton: UIButton {
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        prepareButton()
    }
    
    private func prepareButton() {
        backgroundColor = .primaryButtonBackgroundColor
        titleLabel?.font = .primaryButton
        setTitleColor(.white, for: .normal)
    }
    
}
