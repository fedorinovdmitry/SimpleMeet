//
//  ActiveChatCell.swift
//  SimpleMeet
//
//  Created by Дмитрий Федоринов on 21.10.2020.
//  Copyright © 2020 Дмитрий Федоринов. All rights reserved.
//

import UIKit

class ActiveChatCell: UICollectionViewCell, SelfConfigureCell {
    
    static var reuseId: String = "ActiveChatCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    let friendImageView = UIImageView()
    
    let friendName: UILabel = {
        let label = UILabel()
        label.font = UIFont.appFont(type: .laoSangamMN)
        return label
    }()
    
    let lastMessage: UILabel = {
        let label = UILabel()
        label.font = UIFont.appFont(type: .laoSangamMNmini)
        return label
    }()
    
    let gradientView = GradientView(from: .topTrailing,
                                    to: .bottomLeading,
                                    startColor: UIColor.Pallete.lightGreen,
                                    endColor: UIColor.Pallete.darkGreen)
    
    
    func configure(with value: MChat) {
        friendImageView.image = (UIImage(named: value.userImage) != nil) ? UIImage(named: value.userImage) : UIImage(named: "noImage")
        friendName.text = value.userName
        lastMessage.text = value.lastMessage
    }
    
    private func setUpCell() {
        backgroundColor = UIColor.Pallete.gray
        
        if UIScreen.main.traitCollection.userInterfaceStyle == .light {
            layer.cornerRadius = 4
            clipsToBounds = true
            contentView.layer.cornerRadius = 2.0
            contentView.layer.borderWidth = 1.0
            contentView.layer.borderColor = UIColor.clear.cgColor
            contentView.layer.masksToBounds = true

            layer.shadowColor = UIColor.gray.cgColor
            layer.shadowOffset = CGSize(width: 0, height: 2.0)
            layer.shadowRadius = 2.0
            layer.shadowOpacity = 1.0
            layer.masksToBounds = false
            layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius:self.contentView.layer.cornerRadius).cgPath
        }
        
        
        setUpCellsViews()
    }
    
    private func setUpCellsViews() {
        
        setUpConstraints()
    }
    
}

// MARK: - Set up constraints

extension ActiveChatCell {
    
    func setUpConstraints() {
        addSubviews(views: [friendImageView,
                            friendName,
                            lastMessage,
                            gradientView])
        
        let width = frame.width
        let height = frame.height
        
        //friendImageView constraints
        friendImageView.snp.makeConstraints { make in
            make.top.leading.bottom.equalToSuperview()
            make.width.equalTo(height)
        }
        
        //friendName constraints
        friendName.snp.makeConstraints { make in
            make.leading.equalTo(friendImageView.snp.trailing).offset(width/20)
            make.centerY.equalToSuperview().offset(-(height/5.5))
            make.trailing.equalTo(gradientView.snp.leading).offset(-width/20)
        }
        
        //lastMessage constraints
        lastMessage.snp.makeConstraints { make in
            make.leading.equalTo(friendName.snp.leading)
            make.top.equalTo(friendName.snp.bottom).offset(3)
            make.trailing.equalTo(friendName.snp.trailing).offset(-width/20)
        }
        
        //gradientView constraints
        gradientView.snp.makeConstraints { make in
            make.top.trailing.bottom.equalToSuperview()
            make.width.equalTo(width/70)
        }
        
    }
}

// MARK: - SwiftUI

import SwiftUI

struct ActiveChatCellViewControllerProvider: PreviewProvider {
    
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
