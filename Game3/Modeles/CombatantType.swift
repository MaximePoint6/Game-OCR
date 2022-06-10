//
//  CombatantType.swift
//  Game3
//
//  Created by Maxime Point on 10/06/2022.
//

import Foundation

enum CombatantType: CaseIterable {
    case Warrior
    case Magus
    case Colossus
    case Dwarf
    
    public func getName() -> String {
        switch self {
        case .Warrior: return "Warrior 🥷"
        case .Magus: return "Magus 🧙‍♂️"
        case .Colossus: return "Colossus 🧝"
        case .Dwarf: return "Dwarf 🧌"
        }
    }
    
    public func getMaxHealth() -> Int {
        switch self {
        case .Warrior: return 30
        case .Magus: return 50
        case .Colossus: return 40
        case .Dwarf: return 20
        }
    }
    
    public func getWeapon() -> Weapon {
        switch self {
        case .Warrior: return .Sword
        case .Magus: return .Slingshot
        case .Colossus: return .Bow
        case .Dwarf: return .Chopped
        }
    }
    
    public func getTreatment() -> Treatment {
        switch self {
        case .Warrior: return .None
        case .Magus: return .MagicPotion
        case .Colossus: return .None
        case .Dwarf: return .None
        }
    }
}
