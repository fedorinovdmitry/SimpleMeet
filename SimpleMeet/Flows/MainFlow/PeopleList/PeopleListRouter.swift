//
//  PeopleListRouter.swift
//  SimpleMeet
//
//  Created by Дмитрий Федоринов on 19.10.2020.
//  Copyright (c) 2020 Дмитрий Федоринов. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class PeopleListRouter {

    // MARK: - Private properties

    private weak var viewController: PeopleListViewController!
    
    required init(viewController: PeopleListViewController) {
        self.viewController = viewController
    }

}

// MARK: - Extensions

// MARK: - PeopleListRouterProtocol

extension PeopleListRouter: PeopleListRouterProtocol {
    
}
