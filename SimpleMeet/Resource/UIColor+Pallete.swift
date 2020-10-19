//
//  UIColor.Pallete.shared.swift
//  ThemeSwitcher
//
//  Created by Andrey Raevnev on 07.03.2020.
//  Copyright © 2020 Andrey Raevnev. All rights reserved.
//

import UIKit

extension UIColor {
    
    struct Pallete {

        static let white = UIColor.color(light: .white, dark: .black)
        static let black = UIColor.color(light: .black, dark: .white)
        static func blackWith(alpha: CGFloat = 0.5) -> UIColor {
            return UIColor.color(light: hex("000000", alpha: alpha), dark: hex("FFFFFF", alpha: alpha))
        }
        static let blackGreen = UIColor.color(light: darkGreen, dark: .white)

        
        static let gray = UIColor.color(light: #colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.9411764706, alpha: 1), dark: #colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1))
        
        static let lightGreen = hex("00EB00")
        static let darkGreen = hex("2E482E")
        static func darkGreenWith(alpha: CGFloat = 0.5) -> UIColor {
            return hex("2E482E", alpha: alpha)
        }

    }
}
