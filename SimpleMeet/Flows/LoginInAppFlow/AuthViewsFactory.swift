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
//    func buildTitleLabel(text: String) -> GradientLabel
    func buildRegistrationTitleImageView() -> UIImageView
    func buildAuthTextField(placeHolderText: String, delegate: UITextFieldDelegate?) -> MaterialTextField
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
    
    func buildRegistrationTitleImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: UIImage.AppImage.registration.rawValue.localized())
        return imageView
    }
    
    func buildAuthStandartLabel(text: String) -> UILabel {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = UIColor.Pallete.black
        label.font = UIFont.appFont(type: .avenir)
        label.text = text
        return label
    }
    
//    func buildTitleLabel(text: String) -> GradientLabel {
//        let label = GradientLabel()
//
//        label.numberOfLines = 0
//        label.textColor = UIColor.Pallete.black
//        label.font = UIFont.appFont(type: .phosphateProInlineTitle)
//        label.text = text
//        label.textAlignment = .center
//        label.gradientColors = [UIColor.Pallete.lightGreen.cgColor, UIColor.Pallete.darkGreen.cgColor]
//
//        return label
//    }
    
    func buildAuthStandartButton(text: String) -> MaterialButton {
        let button = MaterialButton(text: text,
                                    font: UIFont.appFont(type: .avenirTitle),
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
    
    func buildAuthTextField(placeHolderText: String, delegate: UITextFieldDelegate?) -> MaterialTextField {
        
        let textField = MaterialTextField(placeholder: placeHolderText,
                                          placeholderColor: UIColor.Pallete.blackWith(alpha: 0.4),
                                          textColor: UIColor.Pallete.black,
                                          bgColor: .clear,
                                          borderColor: UIColor.Pallete.blackWith(alpha: 0.4),
                                          font: UIFont.appFont(type: .avenir),
                                          delegate: delegate)
        
        textField.tintColor = UIColor.Pallete.lightGreen
        textField.rippleLayerColor = UIColor.Pallete.lightGreen
        
        return textField
    }
    
    
}

