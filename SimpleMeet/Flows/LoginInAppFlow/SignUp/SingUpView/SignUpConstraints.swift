//
//  SignUpConstraints.swift
//  SimpleMeet
//
//  Created by Дмитрий Федоринов on 09.09.2020.
//  Copyright © 2020 Дмитрий Федоринов. All rights reserved.
//

import UIKit
import SnapKit

extension SignUpViewController {
    
    // MARK: Setup Constraints
    
    func setupConstraints() {
        
        view.addSubview(signUpScrollView)
        signUpScrollView.addSubview(contentInScrollView)
        contentInScrollView.addSubviews(views: [signUpTitleImageView,
                                                nameTextField,
                                                emailTextField,
                                                passwordTextField,
                                                confirmPasswordTextField,
                                                signUpButton,
                                                alreadyOnBoardLabel,
                                                loginButton])
        
        let height = view.frame.height
        let width = view.frame.width
        let textFieldSpacing = height*0.07
            
        // signUpScrollView constraints
        signUpScrollView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        // contentInScrollView constraints
        contentInScrollView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        // signUpTitleImageView constraints
        signUpTitleImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(height*0.1)
            make.width.equalToSuperview().multipliedBy(0.7)
            make.centerX.equalToSuperview()
        }
        
        // nameTextField constraints
        nameTextField.snp.makeConstraints { make in
            make.top.equalTo(signUpTitleImageView.snp.bottom).offset(height*0.1)
            make.leading.equalToSuperview().offset(width*0.1)
            make.trailing.equalToSuperview().offset(-(width*0.1))
        }
        
        // emailTextField constraints
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(nameTextField.snp.bottom).offset(textFieldSpacing)
            make.leading.equalToSuperview().offset(width*0.1)
            make.trailing.equalToSuperview().offset(-(width*0.1))
        }
        
        // passwordTextField constraints
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(textFieldSpacing)
            make.leading.equalToSuperview().offset(width*0.1)
            make.trailing.equalToSuperview().offset(-(width*0.1))
        }
        
        // confirmPasswordTextField constraints
        confirmPasswordTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(textFieldSpacing)
            make.leading.equalToSuperview().offset(width*0.1)
            make.trailing.equalToSuperview().offset(-(width*0.1))
        }
        
        // signUpButton constraints
        signUpButton.snp.makeConstraints { make in
            make.top.equalTo(confirmPasswordTextField.snp.bottom).offset(textFieldSpacing*0.7)
            make.leading.equalToSuperview().offset(width*0.1)
            make.trailing.equalToSuperview().offset(-(width*0.1))
        }
        
        // alreadyOnBoardLabel constraints
        alreadyOnBoardLabel.snp.makeConstraints { make in
            make.top.equalTo(signUpButton.snp.bottom).offset(textFieldSpacing*0.5)
            make.leading.equalToSuperview().offset(width*0.1)
            make.trailing.equalToSuperview().offset(-(width*0.1))
        }
        // loginButton constraints
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(alreadyOnBoardLabel.snp.bottom).offset(textFieldSpacing*0.5)
            make.leading.equalToSuperview().offset(width*0.1)
            make.trailing.equalToSuperview().offset(-(width*0.1))
        }
        
    }
}
