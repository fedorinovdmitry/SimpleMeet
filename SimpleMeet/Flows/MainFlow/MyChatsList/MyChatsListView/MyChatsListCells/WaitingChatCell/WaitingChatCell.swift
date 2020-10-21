//
//  WaitingChatCell.swift
//  SimpleMeet
//
//  Created by Дмитрий Федоринов on 21.10.2020.
//  Copyright © 2020 Дмитрий Федоринов. All rights reserved.
//

import UIKit

class WaitingChatCell: UICollectionViewCell, SelfConfigureCell {
    
    static var reuseId: String = "WaitingChatCell"
    
    let friendImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with value: MChat) {
        friendImageView.image = (UIImage(named: value.userImage) != nil) ? UIImage(named: value.userImage) : UIImage(named: "noImage")
    }
    
    func setUpCell() {
        layer.cornerRadius = 4
        clipsToBounds = true
        setUpConstraints()
    }
    
    func setUpConstraints() {
        addSubview(friendImageView)
        
        friendImageView.snp.makeConstraints { (make) in
            make.top.leading.bottom.trailing.equalToSuperview()
        }
    }
    
}



// MARK: - SwiftUI

import SwiftUI

struct WaitingChatCellViewControllerProvider: PreviewProvider {
    
    static var previews: some View {
        Group {
            ContainerView().edgesIgnoringSafeArea(.all)
            ContainerView().edgesIgnoringSafeArea(.all)
        }
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        typealias UIViewControllerType = MainTabBarController
        
        let viewController = MainTabBarController()
        
        func makeUIViewController(context: Context) -> MainTabBarController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: MainTabBarController, context: Context) {
            
        }
    }
    
}
