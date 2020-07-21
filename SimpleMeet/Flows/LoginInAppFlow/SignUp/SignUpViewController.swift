//
//  SignUpViewController.swift
//  SimpleMeet
//
//  Created by Дмитрий Федоринов on 21.07.2020.
//  Copyright (c) 2020 Дмитрий Федоринов. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class SignUpViewController: UIViewController, UITextFieldDelegate {

    // MARK: - Dependencies
    
    var presenter: SignUpPresenterProtocol!
    let configurator: SignUpAssemblyProtocol = SignUpAssembly()
    let viewsFactory: AuthViewsFactoryProtocol = AuthViewsFactory()
    
    // MARK: - Properties
    
    // MARK: - LifeStyle ViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        createAndSetupViews()
        presenter.configureView()
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboard), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        
        self.contentInScrollView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(returnTextView(gesture:))))
    }
    
    
    // MARK: - Keyboard with scrollView setup

    @objc func returnTextView(gesture: UIGestureRecognizer) {
        guard activeField != nil else { return }
        activeField?.resignFirstResponder()
        activeField = nil
    }

    @objc func keyboard(notification: Notification) {
        let userInfo = notification.userInfo!
        let keyboardScreenEndFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let keyboardViewEndFrame = view.convert(keyboardScreenEndFrame, to: view.window)
        
        if (notification.name == UIResponder.keyboardWillHideNotification) {
            signUpScrollView.contentInset = UIEdgeInsets.zero
        } else {
            signUpScrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardViewEndFrame.height, right: 0)
        }
        
        signUpScrollView.scrollIndicatorInsets = signUpScrollView.contentInset
    }
    
    var activeField: UITextField?
    var lastOffset: CGPoint!
    var keyboardHeight: CGFloat!
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        activeField = textField
        lastOffset = self.signUpScrollView.contentOffset
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        activeField?.resignFirstResponder()
        activeField = nil
        return true
    }

    
    
    // MARK: - Setup Views
    
    lazy var signUpScrollView: UIScrollView = UIScrollView()
    lazy var contentInScrollView: UIView = UIView()
    
    var signUpTitleImageView: UIImageView!
    
    var nameTextField: MaterialTextField!
    var emailTextField: MaterialTextField!
    var passwordTextField: MaterialTextField!
    var confirmPasswordTextField: MaterialTextField!
    
    var signUpButton: MaterialButton!
    
    var alreadyOnBoardLabel: UILabel!
    var loginButton: MaterialButton!
    
    func createAndSetupViews() {
        view.backgroundColor = UIColor.Pallete.white
        
        signUpTitleImageView = viewsFactory.buildRegistrationTitleImageView()
        nameTextField = viewsFactory.buildAuthTextField(placeHolderText: "Name".localized(),
                                                        delegate: self)
        emailTextField = viewsFactory.buildAuthTextField(placeHolderText: "Email".localized(),
                                                         delegate: self)
        passwordTextField = viewsFactory.buildAuthTextField(placeHolderText: "Password".localized(),
                                                            delegate: self)
        passwordTextField.isSecureTextEntry = true
        confirmPasswordTextField = viewsFactory.buildAuthTextField(placeHolderText: "Confirm Password".localized(),
                                                                   delegate: self)
        confirmPasswordTextField.isSecureTextEntry = true
        
        signUpButton = viewsFactory.buildAuthStandartButton(text: "Sign up".localized())
        alreadyOnBoardLabel = viewsFactory.buildAuthStandartLabel(text: "Already onboard?".localized())
        alreadyOnBoardLabel.textColor = UIColor.Pallete.blackWith(alpha: 0.4)
        loginButton = viewsFactory.buildAuthStandartButton(text: "Login".localized())
        
        setupConstraints()
    }

    
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
//            make.centerX.equalToSuperview()
//            make.width.equalToSuperview()
            
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
        // contentInScrollView constraints
        
    }
    
    // MARK: - Public methods
    
    // MARK: - Private methods

}

// MARK: - Extensions

// MARK: - SignUpViewProtocol

extension SignUpViewController: SignUpViewProtocol {
    
}

// MARK: - SwiftUI

import SwiftUI

struct SignUpViewControllerProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    struct ContainerView: UIViewControllerRepresentable {
        typealias UIViewControllerType = SignUpViewController
        
        let viewController = SignUpViewController()
        
        func makeUIViewController(context: Context) -> SignUpViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: SignUpViewController, context: Context) {
            
        }
    }
}
