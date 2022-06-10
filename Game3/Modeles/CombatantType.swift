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
        case .Warrior: return 40
        case .Magus: return 80
        case .Colossus: return 60
        case .Dwarf: return 30
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
}
