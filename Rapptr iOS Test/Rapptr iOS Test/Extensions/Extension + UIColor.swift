//
//  Colors.swift
//  Rapptr iOS Test
//
//  Created by Sheearz Ahmed on 12/29/21.
//

import Foundation
import UIKit

extension UIColor {
    
    enum ColorNames: String {
        case header_background_color
        case menu_button_color
        case base_view_background_color
        case menu_button_text_color
        case primary_button_background_color
        case primary_textfield_placeholder_color
        case primary_textfield_title_color
        case primary_textfield_background_color
        case chat_text_color
        case chat_bubble_layer_color
    }
    
    class var primaryButtonBackgroundColor: UIColor {
        return UIColor(named: ColorNames.primary_button_background_color.rawValue) ?? .red
    }
    
    class var menuButtonTitleColor: UIColor {
        return UIColor(named: ColorNames.menu_button_text_color.rawValue) ?? .red
    }
    
    class var headerBackgroundColor: UIColor {
        return UIColor(named: ColorNames.header_background_color.rawValue) ?? .red
    }
    
    class var menuButtonBackgroundColor: UIColor {
        return UIColor(named: ColorNames.menu_button_color.rawValue) ?? .red
    }
    
    class var baseViewBackgroundColor: UIColor {
        return UIColor(named: ColorNames.base_view_background_color.rawValue) ?? .red
    }
    
    class var primaryTextFieldPlaceholderColor: UIColor {
        return UIColor(named: ColorNames.primary_textfield_placeholder_color.rawValue) ?? .red
    }
    
    class var primaryTextFieldTitleColor: UIColor {
        return UIColor(named: ColorNames.primary_textfield_title_color.rawValue) ?? .red
    }
    
    class var primaryTextfieldBackgroundColor: UIColor {
        return UIColor(named: ColorNames.primary_textfield_background_color.rawValue) ?? .red
    }
    
    class var chatTextColor: UIColor {
        return UIColor(named: ColorNames.chat_text_color.rawValue) ?? .red
    }
    
    class var chatBubbleLayerColor: UIColor {
        return UIColor(named: ColorNames.chat_bubble_layer_color.rawValue) ?? .red
    }
}
