//
//  Promo.swift
//  uberHackTeam4App
//
//  Created by Atila Costa on 19/05/19.
//  Copyright © 2019 Atila Costa. All rights reserved.
//

import Foundation

class Promo: Codable {
    var id: String
    var value: Double
    var code: String
    var isValid: Bool
    var usedBy: String
}
