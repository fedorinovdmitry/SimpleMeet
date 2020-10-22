//
//  UIFont+app.swift
//  SimpleMeet
//
//  Created by Дмитрий Федоринов on 20.07.2020.
//  Copyright © 2020 Дмитрий Федоринов. All rights reserved.
//

import UIKit

extension UIFont {
    
    ///Scale font size throw all app
    static private var fontSize: CGFloat {
        if UIDevice.iPhoneX {
           return UIScreen.main.bounds.height*0.023
        }
        return UIScreen.main.bounds.height*0.027
    }
    
    enum AppFontType {
        case avenir
        case avenirTitle
        case avenirWith(customSize: CGFloat)
        case avenirBoldTitle
        case phosphateProInlineTitle
        case laoSangamMN
        case laoSangamMNmini
    }
    
    static func appFont(type: AppFontType) -> UIFont {
        var font: UIFont? = nil
        switch type {
        case .avenir:
            font = UIFont.init(name: "Avenir", size: fontSize)
        case .avenirTitle:
            font = UIFont.init(name: "Avenir", size: fontSize+3)
        case .avenirBoldTitle:
            font = UIFont.init(name: "Avenir-Black", size: fontSize+3)
        case .avenirWith(let customSize):
            font = UIFont.init(name: "Avenir", size: customSize)
        case .phosphateProInlineTitle:
            font = UIFont(name: "PhosphatePro-Inline", size: fontSize+10)
        case .laoSangamMN:
            font = UIFont(name: "Lao Sangam MN", size: fontSize)
        case .laoSangamMNmini:
            font = UIFont(name: "Lao Sangam MN", size: fontSize-3)
        }
        return font == nil ? UIFont.systemFont(ofSize: fontSize) : font!
        
    }
    
}
