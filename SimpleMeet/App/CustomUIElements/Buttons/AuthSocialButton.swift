//
//  AuthSocialButton.swift
//  SimpleMeet
//
//  Created by Дмитрий Федоринов on 14.07.2020.
//  Copyright © 2020 Дмитрий Федоринов. All rights reserved.
//

import UIKit

class AuthSocialButton: MaterialVerticalButton {

    enum SocialType {
        case facebook
        case google
        case apple
    }

    init(type: SocialType, frame: CGRect = .zero) {
        super.init(frame: frame)

        self.preserveIconColor = true
        self.foregroundColor = UIColor.Pallete.black
        self.bgColor = .clear
        self.cornerRadius = 20
        self.borderColor = UIColor.Pallete.black
        self.rippleLayerColor = UIColor.Pallete.lightGreen
        
        switch type {
        case .facebook:
            setupFacebookButton()
        case .google:
            setupGoogleButton()
        case .apple:
            setupAppleButton()
        }
    }

    private func setupFacebookButton() {
        guard let image = UIImage.app(.facebook) else { return }
        self.icon = image
    }
    
    private func setupGoogleButton() {
        guard let image = UIImage.app(.google) else { return }
        self.icon = image
    }
    
    private func setupAppleButton() {
        guard let image = UIImage.app(.apple) else { return }
        self.icon = image
    }

    override func layoutSubviews() {
        
        let width = self.frame.width
        let height = self.frame.height
        imageView.contentMode = .scaleAspectFit
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(0.15*height)
            make.leading.equalToSuperview().offset(0.1*width)
            make.trailing.equalToSuperview().offset(-0.1*width)
            make.height.equalToSuperview().multipliedBy(0.70)
        }
        

        self.layoutIfNeeded()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


}

