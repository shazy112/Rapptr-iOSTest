//
//  Extension + UIFont.swift
//  Rapptr iOS Test
//
//  Created by Sheearz Ahmed on 12/31/21.
//

import Foundation
import UIKit

extension UIFont {
    
    class var headerText: UIFont {
        return UIFont.systemFont(ofSize: 17, weight: .semibold)
    }
    
    class var menuButton: UIFont {
        return UIFont.systemFont(ofSize: 16, weight: .semibold)
    }
    
    class var primaryButton: UIFont {
        return UIFont.systemFont(ofSize: 16, weight: .semibold)
    }
    
    class var primaryTextFieldTitle: UIFont {
        return UIFont.systemFont(ofSize: 16, weight: .regular)
    }
    
    class var primaryTextFieldPlaceholder: UIFont {
        return UIFont.systemFont(ofSize: 16, weight: .regular)
    }
    
    class var chatHeader: UIFont {
        return UIFont.systemFont(ofSize: 13, weight: .semibold)
    }
    
    class var message: UIFont {
        return UIFont.systemFont(ofSize: 15, weight: .regular)
    }
}
