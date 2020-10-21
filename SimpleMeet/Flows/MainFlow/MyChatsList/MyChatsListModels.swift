//
//  MyChatsListModels.swift
//  SimpleMeet
//
//  Created by Дмитрий Федоринов on 21.10.2020.
//  Copyright © 2020 Дмитрий Федоринов. All rights reserved.
//

import Foundation

struct MChat: Hashable {
    var userName: String
    var userImage: String
    var lastMessage: String
    var id = UUID()
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    static func == (lhs: MChat, rhs: MChat) -> Bool {
        return lhs.id == rhs.id
    }
}
