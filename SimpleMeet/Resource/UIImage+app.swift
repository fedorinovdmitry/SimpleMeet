//
//  UIImage+app.swift
//  ThemeSwitcher
//
//  Created by Andrey Raevnev on 07.03.2020.
//  Copyright © 2020 Andrey Raevnev. All rights reserved.
//

import UIKit

extension UIImage {
    
    /// AppImageCreator. If you want to sup darkMode -> you must dowload dark image version in assets and add "Dark" in image's name
    enum AppImage: String, CaseIterable {
        case logo
        
        case avatar
        case plus
        
        case registration
        case authorization
        case setUpProfile
        
        case facebook
        case google
        case apple
    }
    
    static func app(_ appImage: AppImage, rendering: RenderingMode = .automatic) -> UIImage? {
        return UIImage(named: appImage.rawValue)?.withRenderingMode(rendering)
    }
    
}
