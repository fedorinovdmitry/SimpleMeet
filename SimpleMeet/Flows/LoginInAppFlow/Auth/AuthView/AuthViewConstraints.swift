//
//  AuthViewConstraints.swift
//  SimpleMeet
//
//  Created by Дмитрий Федоринов on 09.09.2020.
//  Copyright © 2020 Дмитрий Федоринов. All rights reserved.
//

import UIKit
import SnapKit

extension AuthViewController {
    
    // MARK: Constraints

    func setupConstraints() {
        
        view.addSubviews(views: [logoImageView,
                                 getStartedWithLabel,
                                 socialButtonsStackView,
                                 signUpWithLabel,
                                 emailAuthButton,
                                 alreadyOnBoard,
                                 loginAuthButton])
        
        let height = view.frame.height
        let width = view.frame.width
        
        // logoImageView constraints
        logoImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(height*0.05)
            make.leading.trailing.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.35)
        }
        
        // getStartedWithLabel constraints
        getStartedWithLabel.snp.makeConstraints { make in
            make.top.equalTo(logoImageView.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(width*0.05)
            make.trailing.equalToSuperview().offset(-(width*0.05))
        }
        
        // socialButtonsStackView constraints
        socialButtonsStackView.snp.makeConstraints { make in
            make.top.equalTo(getStartedWithLabel.snp.bottom).offset(13)
            make.leading.equalToSuperview().offset(width*0.05)
            make.trailing.equalToSuperview().offset(-(width*0.05))
            make.height.equalTo(height*0.13)
        }
        
        // signUpWithLabel constraints
        signUpWithLabel.snp.makeConstraints { make in
            make.top.equalTo(socialButtonsStackView.snp.bottom).offset(13)
            make.leading.equalToSuperview().offset(width*0.05)
            make.trailing.equalToSuperview().offset(-(width*0.05))
        }
        
        // emailAuthButton constraints
        emailAuthButton.snp.makeConstraints { make in
            make.top.equalTo(signUpWithLabel.snp.bottom).offset(13)
            make.leading.equalToSuperview().offset(width*0.05)
            make.trailing.equalToSuperview().offset(-(width*0.05))
            make.height.equalTo(socialButtonsStackView.snp.height).multipliedBy(0.45)
        }
        
        // alreadyOnBoard constraints
        alreadyOnBoard.snp.makeConstraints { make in
            make.top.equalTo(emailAuthButton.snp.bottom).offset(13)
            make.leading.equalToSuperview().offset(width*0.05)
            make.trailing.equalToSuperview().offset(-(width*0.05))
        }
        
        // loginAuthButton constraints
        loginAuthButton.snp.makeConstraints { make in
            make.top.equalTo(alreadyOnBoard.snp.bottom).offset(13)
            make.leading.equalToSuperview().offset(width*0.05)
            make.trailing.equalToSuperview().offset(-(width*0.05))
            make.height.equalTo(socialButtonsStackView.snp.height).multipliedBy(0.45)
        }
    }
    
}
