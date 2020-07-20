//
//  AuthViewController.swift
//  SimpleMeet
//
//  Created by Дмитрий Федоринов on 14.07.2020.
//  Copyright (c) 2020 Дмитрий Федоринов. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit
import SnapKit

final class AuthViewController: UIViewController {

    // MARK: - Custom types

    // MARK: - Public Properties
    
    var presenter: AuthPresenterProtocol!
    let configurator: AuthAssemblyProtocol = AuthAssembly()
    let viewsFactory: AuthViewsFactoryProtocol = AuthViewsFactory()
    
    // MARK: - Setup Views
    
    lazy var socialButtonsStackView = UIStackView(axis: .horizontal,
                                                  distribution: .fillEqually,
                                                  spacing: 10)
    var logoImageView: UIImageView!
    
    var getStartedWithLabel: UILabel!
    var facebookAuthButton: AuthSocialButton!
    var googleAuthButton: AuthSocialButton!
    var appleAuthButton: AuthSocialButton!
    
    var signUpWithLabel: UILabel!
    var emailAuthButton: MaterialButton!
    
    var alreadyOnBoard: UILabel!
    var loginAuthButton: MaterialButton!
    
    func createAndSetupViews() {
        
        view.backgroundColor = UIColor.Pallete.white
        
        logoImageView = viewsFactory.buildLogoImageView()
        
        getStartedWithLabel = viewsFactory.buildAuthStandartLabel(text: "Get started with:".localized())
        facebookAuthButton = viewsFactory.buildSocialButton(type: .facebook)
        googleAuthButton = viewsFactory.buildSocialButton(type: .google)
        appleAuthButton = viewsFactory.buildSocialButton(type: .apple)
        
        signUpWithLabel = viewsFactory.buildAuthStandartLabel(text: "or sign up with:".localized())
        emailAuthButton = viewsFactory.buildAuthStandartButton(text: "Email".localized())
        
        alreadyOnBoard = viewsFactory.buildAuthStandartLabel(text: "Already onboard?".localized())
        loginAuthButton = viewsFactory.buildAuthStandartButton(text: "Login".localized())
        
        addConstraints()
    }
    
    
    // MARK: Constraints

    func addConstraints() {
        socialButtonsStackView.addArrangedSubview(facebookAuthButton)
        socialButtonsStackView.addArrangedSubview(googleAuthButton)
        socialButtonsStackView.addArrangedSubview(appleAuthButton)
        
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
    
    
    
    // MARK: - LifeStyle ViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        createAndSetupViews()
        presenter.configureView()
        
    }
    
    // MARK: - IBAction
    
    // MARK: - Public methods
    
    // MARK: - Private methods

}

// MARK: - Extensions

// MARK: - AuthViewProtocol

extension AuthViewController: AuthViewProtocol {
    
}


import SwiftUI

struct AutViewControllerProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    struct ContainerView: UIViewControllerRepresentable {
        typealias UIViewControllerType = AuthViewController
        
        let viewController = AuthViewController()
        
        func makeUIViewController(context: Context) -> AuthViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: AuthViewController, context: Context) {
            
        }
    }
}
