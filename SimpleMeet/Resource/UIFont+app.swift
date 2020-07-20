//
//  UIFont+app.swift
//  SimpleMeet
//
//  Created by Дмитрий Федоринов on 20.07.2020.
//  Copyright © 2020 Дмитрий Федоринов. All rights reserved.
//

import UIKit

extension UIFont {
    
    static func appFont(size: CGFloat = 20) -> UIFont {
        guard let font = UIFont.init(name: "Avenir",
                                     size: size)
            else {
                return UIFont.systemFont(ofSize: size)
        }
        return font
    }
    
    static func appFontTitle(size: CGFloat = 26) -> UIFont {
        guard let font = UIFont.init(name: "Avenir",
                                     size: size)
            else {
                return UIFont.systemFont(ofSize: size)
        }
        return font
    }
    
}
