//
//  Combatant.swift
//  Game3
//
//  Created by Maxime Point on 10/06/2022.
//

import Foundation

class Combatant {
    var name: String
    var type: CombatantType
    var currentHP: Int
    var weapon: Weapon
    var treatment: Treatment
    
    required init(type: CombatantType, name: String) {
        self.type = type
        self.currentHP = type.getMaxHealth()
        self.name = name
        self.weapon = type.getWeapon()
        self.treatment = type.getTreatment()
    }
    
    static var namesUsed: [String] = []
    
}
