//
//  Enums.swift
//  uberHackTeam4App
//
//  Created by Atila Costa on 19/05/19.
//  Copyright © 2019 Atila Costa. All rights reserved.
//

import Foundation

enum Collections: String {
    case locations
    case users
    case promos
}

enum Segues: String {
    case presentQR
    case presentShop
    case presentDone
}

enum Credits: Int {
    case yellow5 = 1
    case yellow10 = 2
    case yellow20 = 3
}
