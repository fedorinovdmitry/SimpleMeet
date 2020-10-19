//
//  AddPhotoView.swift
//  SimpleMeet
//
//  Created by Дмитрий Федоринов on 23.07.2020.
//  Copyright © 2020 Дмитрий Федоринов. All rights reserved.
//

import UIKit
import SnapKit

class AddPhotoView: UIView {
    
    lazy var circleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.app(.avatar)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.borderColor = UIColor.Pallete.black.cgColor
        imageView.layer.borderWidth = 1
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = self.frame.width*0.7 / 2
        return imageView
    }()
    
    let plusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage.app(.plus), for: .normal)
        button.tintColor = UIColor.Pallete.black
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        
        setupConstraints()
        
        layoutIfNeeded()
    }
    
    private func setupConstraints() {
        addSubviews(views: [circleImageView, plusButton])
    
        let width = round(frame.width)
        
        circleImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().labeled("circleimageLeading")
            make.centerY.equalToSuperview().labeled("circleimageCenterY")
            make.width.equalToSuperview().multipliedBy(0.7).labeled("circleimageWidth")
            make.height.equalTo(circleImageView.snp.width).labeled("circleimageHeight")
        }
        
        plusButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview()
            make.width.equalTo(width*0.2).labeled("plusButtonWidth")
            make.height.equalTo(width*0.2)
        }
        
        
    
    }
}
