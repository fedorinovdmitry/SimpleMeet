//
//  SelfConfigureCell.swift
//  SimpleMeet
//
//  Created by Дмитрий Федоринов on 21.10.2020.
//  Copyright © 2020 Дмитрий Федоринов. All rights reserved.
//

import Foundation

protocol SelfConfigureCell {
    static var reuseId: String { get }
    func configure(with value: MChat)
}
