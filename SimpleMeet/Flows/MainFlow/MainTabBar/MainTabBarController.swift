//
//  MainTabBarController.swift
//  SimpleMeet
//
//  Created by Дмитрий Федоринов on 19.10.2020.
//  Copyright © 2020 Дмитрий Федоринов. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpTabBar()
        
        viewControllers = [
            createTabBarVC(vCType: .myChatsListVC),
            createTabBarVC(vCType: .peopleListVC)
        ]
    }
    
    
    // MARK: - Set up TabBar

    private func setUpTabBar() {
        
        tabBar.tintColor = UIColor.Pallete.lightGreen
        tabBar.unselectedItemTintColor = UIColor.Pallete.black
        tabBar.backgroundImage = UIImage()
        
    }
    
    
    // MARK: - Create VCs

    private enum TabBarVC {
        case peopleListVC
        case myChatsListVC
    }
    
    private func createTabBarVC(vCType: TabBarVC) -> UINavigationController {
        let tabBarVC: UIViewController
        let vCTitle: String
        let imageConfig = UIImage.SymbolConfiguration(weight: .medium)
        let vCImage: UIImage?
        
        switch vCType {
        case .myChatsListVC:
            tabBarVC = MyChatsListViewController()
            vCTitle = "Messenger".localized(with: .mainFlow)
            vCImage = UIImage(systemName: "bubble.left.and.bubble.right.fill",
                              withConfiguration: imageConfig)
        case .peopleListVC:
            tabBarVC = PeopleListViewController()
            vCTitle = "People".localized(with: .mainFlow)
            let peopleListImageConfig = UIImage.SymbolConfiguration(pointSize: 21,
                                                                    weight: .medium)
            vCImage = UIImage(systemName: "network",
                              withConfiguration: peopleListImageConfig)
        }
        
        return generateNavigationController(rootViewController: tabBarVC,
                                            title: vCTitle,
                                            image: vCImage)
        
    }
    
    private func generateNavigationController(rootViewController: UIViewController,
                                              title: String,
                                              image: UIImage?) -> UINavigationController {
        let navigationVC = UINavigationController(rootViewController: rootViewController)
        navigationVC.tabBarItem.title = title
        navigationVC.tabBarItem.image = image
        return navigationVC
    }
}
