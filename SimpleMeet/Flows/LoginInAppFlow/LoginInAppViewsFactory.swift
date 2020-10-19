//
//  LoginInAppViewsFactory.swift
//  SimpleMeet
//
//  Created by Дмитрий Федоринов on 20.07.2020.
//  Copyright © 2020 Дмитрий Федоринов. All rights reserved.
//

import UIKit

protocol LoginInAppViewsFactoryProtocol {
    
    // ImageViews
    func buildLogoImageView() -> UIImageView
    func buildTitleImageViewWith(image: UIImage.AppImage) -> UIImageView
    
    // Labels
    func buildStandartLabel(text: String) -> UILabel
    
    // Buttons
    func buildStandartButton(text: String) -> MaterialButton
    func buildSocialButton(type: AuthSocialButton.SocialType, frame: CGRect) -> AuthSocialButton
    
    // StackViews
    func buildSocialButtonsStackView() -> UIStackView
    
    // TextFields
    func buildAppTextField(placeHolderText: String, delegate: UITextFieldDelegate?) -> MaterialTextField
    
    // Views
    func buildAddPhotoView() -> AddPhotoView
    
    // SegmentControl
    func buildSegmentControlWith(segmentsText: [String]) -> MaterialSegmentedControl
}
class LoginInAppViewsFactory: LoginInAppViewsFactoryProtocol {
    
    // MARK: - ImageViews

    func buildLogoImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage.app(.logo)
        return imageView
    }
    
    func buildTitleImageViewWith(image: UIImage.AppImage) -> UIImageView {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: image.rawValue.localized(with: .loginInAppFlow))
        return imageView
    }
    
    
    // MARK: - Labels

    func buildStandartLabel(text: String) -> UILabel {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = UIColor.Pallete.black
        label.font = UIFont.appFont(type: .avenir)
        label.text = text
        return label
    }
    
    // MARK: - Buttons

    func buildStandartButton(text: String) -> MaterialButton {
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
    
    func buildSocialButton(type: AuthSocialButton.SocialType, frame: CGRect = .zero) -> AuthSocialButton {
        
        let button: AuthSocialButton
        switch type {
        case .facebook:
            button = AuthSocialButton.init(type: .facebook,
                                           frame: frame)
        case .google:
            button = AuthSocialButton.init(type: .google,
                                           frame: frame)
        case .apple:
            button = AuthSocialButton.init(type: .apple,
                                           frame: frame)
        }
        
        return button
    }
    
    
    // MARK: - StackViews
    
    func buildSocialButtonsStackView() -> UIStackView  {
        
        let socialButtonsStackView = UIStackView(axis: .horizontal,
                                                 distribution: .fillEqually,
                                                 spacing: 10)
        
        let facebookAuthButton = buildSocialButton(type: .facebook)
        let googleAuthButton = buildSocialButton(type: .google)
        let appleAuthButton = buildSocialButton(type: .apple)
        
        socialButtonsStackView.addArrangedSubviews(views: [facebookAuthButton,
                                                           googleAuthButton,
                                                           appleAuthButton])
        
        return socialButtonsStackView
        
    }

    // MARK: - TextFields

    func buildAppTextField(placeHolderText: String, delegate: UITextFieldDelegate?) -> MaterialTextField {
        
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
    
    // MARK: - Views
    
    func buildAddPhotoView() -> AddPhotoView {
        return AddPhotoView()
    }
    
    // MARK: - SegmentControll
    
    func buildSegmentControlWith(segmentsText: [String]) -> MaterialSegmentedControl {
        
        let segmentControl = MaterialSegmentedControl(selectorStyle: .fill, cornerRadius: 20.0)
        for text in segmentsText {
            segmentControl.appendTextSegment(text: text, textColor: UIColor.Pallete.black, rippleColor: UIColor.Pallete.lightGreen)
        }
        
        return segmentControl
    }
}

