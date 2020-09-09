//
//  SignInConstraints.swift
//  SimpleMeet
//
//  Created by Дмитрий Федоринов on 09.09.2020.
//  Copyright © 2020 Дмитрий Федоринов. All rights reserved.
//

import UIKit
import SnapKit

extension SignInViewController {
    
    // MARK: Setup Constraints
       
       func setupConstraints() {
           
           view.addSubview(signInScrollView)
           signInScrollView.addSubview(contentInScrollView)
           contentInScrollView.addSubviews(views: [signInTitleImageView,
                                                   loginWithLabel,
                                                   socialButtonsStackView,
                                                   orLabel,
                                                   emailTextField,
                                                   passwordTextField,
                                                   loginButton,
                                                   needAnAccountLabel,
                                                   signUpButton])
           
           let height = view.frame.height
           let width = view.frame.width
           let viewsSpacing = height*0.035
           let indent = width*0.1
               
           // signInScrollView constraints
           signInScrollView.snp.makeConstraints { make in
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
           
           // signInTitleImageView constraints
           signInTitleImageView.snp.makeConstraints { make in
               make.top.equalToSuperview().offset(height*0.1)
               make.width.equalToSuperview().multipliedBy(0.7)
               make.centerX.equalToSuperview()
           }
           
           // loginWithLabel constraints
           loginWithLabel.snp.makeConstraints { make in
               make.top.equalTo(signInTitleImageView.snp.bottom).offset(viewsSpacing*2)
               make.leading.equalToSuperview().offset(indent)
               make.trailing.equalToSuperview().offset(-indent)
           }
           
           // socialButtonsStackView constraints
           socialButtonsStackView.snp.makeConstraints { make in
               make.top.equalTo(loginWithLabel.snp.bottom).offset(viewsSpacing)
               make.leading.equalToSuperview().offset(indent*0.5)
               make.trailing.equalToSuperview().offset(-indent*0.5)
               make.height.equalTo(height*0.13)
           }
           
           // orLabel constraints
           orLabel.snp.makeConstraints { make in
               make.top.equalTo(socialButtonsStackView.snp.bottom).offset(viewsSpacing)
               make.leading.equalToSuperview().offset(indent)
               make.trailing.equalToSuperview().offset(-indent)
           }
           
           // emailTextField constraints
           emailTextField.snp.makeConstraints { make in
               make.top.equalTo(orLabel.snp.bottom).offset(viewsSpacing*1.25)
               make.leading.equalToSuperview().offset(indent)
               make.trailing.equalToSuperview().offset(-indent)
           }
           
           // passwordTextField constraints
           passwordTextField.snp.makeConstraints { make in
               make.top.equalTo(emailTextField.snp.bottom).offset(viewsSpacing*1.25)
               make.leading.equalToSuperview().offset(indent)
               make.trailing.equalToSuperview().offset(-indent)
           }
           
           // loginButton constraints
           loginButton.snp.makeConstraints { make in
               make.top.equalTo(passwordTextField.snp.bottom).offset(viewsSpacing*1.5)
               make.leading.equalToSuperview().offset(indent)
               make.trailing.equalToSuperview().offset(-indent)
           }
           
           // needAnAccountLabel constraints
           needAnAccountLabel.snp.makeConstraints { make in
               make.top.equalTo(loginButton.snp.bottom).offset(viewsSpacing)
               make.leading.equalToSuperview().offset(indent)
               make.trailing.equalToSuperview().offset(-indent)
           }
           
           // signUpButton constraints
           signUpButton.snp.makeConstraints { make in
               make.top.equalTo(needAnAccountLabel.snp.bottom).offset(viewsSpacing)
               make.leading.equalToSuperview().offset(indent)
               make.trailing.equalToSuperview().offset(-indent)
           }
           
       }
}
