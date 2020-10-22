//
//  SectionHeader.swift
//  SimpleMeet
//
//  Created by Дмитрий Федоринов on 22.10.2020.
//  Copyright © 2020 Дмитрий Федоринов. All rights reserved.
//

import UIKit

class SectionHeader: UICollectionReusableView {
    
    static let reuseId = "SectionHeader"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(text: String,
                   font: UIFont = UIFont.appFont(type: .avenirBoldTitle),
                   textColor: UIColor = UIColor.Pallete.black) {
        titleLabel.text = text
        titleLabel.font = font
        titleLabel.textColor = textColor
    }
    
    let titleLabel = UILabel()
    
    private func setUpViews() {
        
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        
        addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.leading.bottom.trailing.equalToSuperview()
        }
        
    }
    
    
}
