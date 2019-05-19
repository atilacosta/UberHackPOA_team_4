//
//  User.swift
//  uberHackTeam4App
//
//  Created by Atila Costa on 19/05/19.
//  Copyright © 2019 Atila Costa. All rights reserved.
//

import Foundation

class User: Codable {
    var id: String = UUID().uuidString
    var credits: Double = 5.97
    
    init(id: String) {
        self.id = id
    }
}
