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

final class AuthViewController: UIViewController {

    // MARK: - Public Properties
    
    var presenter: AuthPresenterProtocol!
    let configurator: AuthAssemblyProtocol = AuthAssembly()
    let viewsFactory: LoginInAppViewsFactoryProtocol = LoginInAppViewsFactory()
    
    // MARK: - LifeStyle ViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        createAndSetupViews()
        presenter.configureView()
        
    }
    
    // MARK: - Setup Views
    
    
    var logoImageView: UIImageView!
    
    var getStartedWithLabel: UILabel!
    var socialButtonsStackView: UIStackView!
    
    
    var signUpWithLabel: UILabel!
    var emailAuthButton: MaterialButton!
    
    var alreadyOnBoard: UILabel!
    var loginAuthButton: MaterialButton!
    
    func createAndSetupViews() {
        
        view.backgroundColor = UIColor.Pallete.white
        
        logoImageView = viewsFactory.buildLogoImageView()
        
        getStartedWithLabel = viewsFactory.buildStandartLabel(text: "Get started with:".localized(with: .loginInAppFlow))
        socialButtonsStackView = viewsFactory.buildSocialButtonsStackView()
        
        signUpWithLabel = viewsFactory.buildStandartLabel(text: "or sign up with:".localized(with: .loginInAppFlow))
        emailAuthButton = viewsFactory.buildStandartButton(text: "EmailWithRuAdaptation".localized(with: .loginInAppFlow))
        
        alreadyOnBoard = viewsFactory.buildStandartLabel(text: "Already onboard?".localized(with: .loginInAppFlow))
        loginAuthButton = viewsFactory.buildStandartButton(text: "Login".localized(with: .loginInAppFlow))
        
        setupConstraints()
    }
    
    
    // MARK: - Public methods
    
    // MARK: - Private methods

}

// MARK: - Extensions

// MARK: - AuthViewProtocol

extension AuthViewController: AuthViewProtocol {
    
}



// MARK: - SwiftUI

import SwiftUI

struct AuthViewControllerProvider: PreviewProvider {
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
