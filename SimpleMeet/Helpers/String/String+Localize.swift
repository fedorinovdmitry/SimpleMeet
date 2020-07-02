//
//  String+Localize.swift
//  SimpleMeet
//
//  Created by Дмитрий Федоринов on 02.07.2020.
//  Copyright © 2020 Дмитрий Федоринов. All rights reserved.
//

import Foundation

extension String {
    
    func localized(bundle: Bundle = .main,
                   tableName: String = "Localizable",
                   comment: String = "") -> String {
        return NSLocalizedString(self,
                                 tableName: tableName,
                                 value: "**\(self)**",
                                 comment: comment)
    }
}
