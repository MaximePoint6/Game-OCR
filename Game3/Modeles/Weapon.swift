//
//  Weapon.swift
//  Game3
//
//  Created by Maxime Point on 10/06/2022.
//

import Foundation

//class Weapon {
//    var weaponName: String = ""
//    var weaponStrength: Int = 1
//
//    init(weaponName: String, weaponStrength: Int) {
//        self.weaponName = weaponName
//        self.weaponStrength = weaponStrength
//    }
//}


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
        case .Sword: return 18
        case .Slingshot: return 8
        case .Bow: return 12
        case .Chopped: return 25
        }
    }
}


//var weapons: [Weapon] = [
//    Weapon(weaponName: "Epée", weaponStrength: 18),
//    Weapon(weaponName: "Lance-pierre", weaponStrength: 8),
//    Weapon(weaponName: "Arc", weaponStrength: 12),
//    Weapon(weaponName: "Hache", weaponStrength: 25)
//]
