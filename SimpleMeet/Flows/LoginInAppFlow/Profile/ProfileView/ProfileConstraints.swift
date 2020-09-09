//
//  ProfileConstraints.swift
//  SimpleMeet
//
//  Created by Дмитрий Федоринов on 09.09.2020.
//  Copyright © 2020 Дмитрий Федоринов. All rights reserved.
//

import UIKit
import SnapKit

extension ProfileViewController {
    
    // MARK: Setup Constraints
       
       func setupConstraints() {
           
           view.addSubview(profileScrollView)
           profileScrollView.addSubview(contentInScrollView)
           contentInScrollView.addSubviews(views: [setupProfileTitleImageView,
                                                   addPhotoView,
                                                   fullNameTextField,
                                                   aboutMeTextField,
                                                   sexLabel,
                                                   sexSegmentControl,
                                                   goToChatsButton])

           
           let height = view.frame.height
           let width = view.frame.width
           
           // signUpScrollView constraints
           profileScrollView.snp.makeConstraints { make in
               make.top.equalTo(view.safeAreaLayoutGuide).labeled("scroltop")
               make.leading.equalToSuperview().labeled("scrollead")
               make.trailing.equalToSuperview().labeled("scroltrail")
               make.bottom.equalTo(view.safeAreaLayoutGuide).labeled("scrolbot")
           }

           // contentInScrollView constraints
           contentInScrollView.snp.makeConstraints { make in
               make.leading.equalToSuperview().labeled("contlead")
               make.trailing.equalToSuperview().labeled("conttrail")
               make.width.equalToSuperview().labeled("contwidth")
               make.height.equalToSuperview().labeled("contheight")
               make.top.equalToSuperview().labeled("conttop")
               make.bottom.equalToSuperview().labeled("contbot")
           }
           
           // setupProfileTitleImageView constraints
           setupProfileTitleImageView.snp.makeConstraints { make in
               make.top.equalToSuperview().offset(height*0.1)
               make.width.equalToSuperview().multipliedBy(0.45)
               make.centerX.equalToSuperview()
           }
           
           // addPhotoView constraints
           addPhotoView.snp.makeConstraints { make in
               make.top.equalTo(setupProfileTitleImageView.snp.bottom).offset(height*0.15)
               make.centerX.equalToSuperview()
               make.width.equalToSuperview().multipliedBy(0.4)
           }
           
           // fullNameTextField constraints
           fullNameTextField.snp.makeConstraints { make in
               make.top.equalTo(addPhotoView.snp.bottom).offset(height*0.12)
               make.leading.equalToSuperview().offset(width*0.1)
               make.trailing.equalToSuperview().offset(-(width*0.1))
           }
           
           // aboutMeTextField constraints
           aboutMeTextField.snp.makeConstraints { make in
               make.top.equalTo(fullNameTextField.snp.bottom).offset(height*0.05)
               make.leading.equalToSuperview().offset(width*0.1)
               make.trailing.equalToSuperview().offset(-(width*0.1))
           }
           
           // sexLabel constraints
           sexLabel.snp.makeConstraints { make in
               make.top.equalTo(aboutMeTextField.snp.bottom).offset(height*0.05)
               make.leading.equalToSuperview().offset(width*0.1)
               make.trailing.equalToSuperview().offset(-(width*0.1))
           }
           
           // sexSegmentControl constraints
           sexSegmentControl.snp.makeConstraints { make in
               make.top.equalTo(sexLabel.snp.bottom).offset(height*0.02)
               make.leading.equalToSuperview().offset(width*0.2)
               make.trailing.equalToSuperview().offset(-(width*0.2))
               make.height.equalTo(height*0.07)
           }
           
           // goToChatsButton constraints
           goToChatsButton.snp.makeConstraints { make in
               make.top.equalTo(sexSegmentControl.snp.bottom).offset(height*0.06)
               make.leading.equalToSuperview().offset(width*0.1)
               make.trailing.equalToSuperview().offset(-(width*0.1))
               make.height.equalTo(sexSegmentControl.snp.height)
           }
       }

}
