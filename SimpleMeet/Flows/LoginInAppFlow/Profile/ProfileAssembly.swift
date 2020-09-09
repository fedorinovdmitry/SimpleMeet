//
//  ProfileAssembly.swift
//  SimpleMeet
//
//  Created by Дмитрий Федоринов on 23.07.2020.
//  Copyright (c) 2020 Дмитрий Федоринов. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class ProfileAssembly: ProfileAssemblyProtocol {

    // MARK: - Module setup

    func configure(with viewController: ProfileViewController) {
        let presenter = ProfilePresenter(view: viewController)
        let interactor = ProfileInteractor(presenter: presenter)
        let router = ProfileRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }

}

