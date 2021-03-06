//
//  Weapon.swift
//  Game3
//
//  Created by Maxime Point on 10/06/2022.
//

import Foundation

enum Weapon {
    case Sword
    case Slingshot
    case Bow
    case Chopped
    
    public func getName() -> String {
        switch self {
        case .Sword: return "Epée"
        case .Slingshot: return "Lance-pierre"
        case .Bow: return "Arc"
        case .Chopped: return "Hache"
        }
    }
    
    public func weaponStrength() -> Int {
        switch self {
        case .Sword: return 15
        case .Slingshot: return 8
        case .Bow: return 12
        case .Chopped: return 20
        }
    }
}
