//
//  AuthViewsFactory.swift
//  SimpleMeet
//
//  Created by Дмитрий Федоринов on 20.07.2020.
//  Copyright © 2020 Дмитрий Федоринов. All rights reserved.
//

import UIKit

protocol AuthViewsFactoryProtocol {
    func buildAuthStandartButton(text: String) -> MaterialButton
    func buildSocialButton(type: AuthSocialButton.SocialType) -> AuthSocialButton
    func buildLogoImageView() -> UIImageView
    func buildAuthStandartLabel(text: String) -> UILabel
}
class AuthViewsFactory: AuthViewsFactoryProtocol {
    
    private let socialButtonsSize = CGSize(width: 70, height: 70)
    private lazy var simpleButtonHeight = CGFloat(socialButtonsSize.height / 2)
    
    func buildLogoImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage.app(.logo)
        return imageView
    }
    
    func buildAuthStandartLabel(text: String) -> UILabel {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = UIColor.Pallete.black
        label.text = text
        return label
    }
    
    func buildAuthStandartButton(text: String) -> MaterialButton {
        let button = MaterialButton(text: text,
                                    font: UIFont.appFont(),
                                    textColor: UIColor.Pallete.black,
                                    bgColor: .clear,
                                    borderColor: UIColor.Pallete.black,
                                    cornerRadius: 20,
                                    withShadow: false)
        button.rippleLayerColor = UIColor.Pallete.lightGreen
        return button
    }
    
    func buildSocialButton(type: AuthSocialButton.SocialType) -> AuthSocialButton {
        
        let button: AuthSocialButton
        switch type {
        case .facebook:
            button = AuthSocialButton.init(type: .facebook,
                                           frame: CGRect(origin: .zero,
                                                         size: socialButtonsSize))
        case .google:
            button = AuthSocialButton.init(type: .google,
                                           frame: CGRect(origin: .zero,
                                                         size: socialButtonsSize))
        case .apple:
            button = AuthSocialButton.init(type: .apple,
                                           frame: CGRect(origin: .zero,
                                                         size: socialButtonsSize))
        }
        
        return button
    }
    
    
}

