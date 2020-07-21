//
//  UIStackView+addArrSub.swift
//  SimpleMeet
//
//  Created by Дмитрий Федоринов on 21.07.2020.
//  Copyright © 2020 Дмитрий Федоринов. All rights reserved.
//

import UIKit

extension UIStackView {
    
    func addArrangedSubviews(views: [UIView]) {
        views.forEach { self.addArrangedSubview($0)}
    }
    
}
