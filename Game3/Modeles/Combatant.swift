//
//  Combatant.swift
//  Game3
//
//  Created by Maxime Point on 10/06/2022.
//

import Foundation

//class Combatant {
//    var combatantName: String = "Combattant"
//    var combatantType: CombatantType = combatantTypes[0]
//
//    static var names: [String] = []
//}

class Combatant {
    var name: String
    var type: CombatantType
    var currentHP: Int
    var weapon: Weapon
    
    required init(type: CombatantType, name: String) {
        self.type = type
        self.currentHP = type.getMaxHealth()
        self.name = name
        self.weapon = type.getWeapon()
    }
    
    static var names: [String] = []
}

//class CombatantType {
//    var typeName: String = ""
//    var life: Int = 100
//    var weapon: Weapon = Weapon(weaponName: weapons[0].weaponName, weaponStrength: weapons[0].weaponStrength)
//
//    init(typeName: String, life: Int, weapon: Weapon){
//        self.typeName = typeName
//        self.life = life
//        self.weapon = weapon
//    }
//}


// MARK: - Datas

//var weapons: [Weapon] = [
//    Weapon(weaponName: "Epée", weaponStrength: 18),
//    Weapon(weaponName: "Lance-pierre", weaponStrength: 8),
//    Weapon(weaponName: "Arc", weaponStrength: 12),
//    Weapon(weaponName: "Hache", weaponStrength: 25)
//]
//
//var combatantTypes: [CombatantType] = [
//    CombatantType(typeName: "Warrior 🥷", life: 40, weapon: weapons[0]),
//    CombatantType(typeName: "Magus 🧙‍♂️", life: 80, weapon: weapons[1]),
//    CombatantType(typeName: "Colossus 🧝", life: 60, weapon: weapons[2]),
//    CombatantType(typeName: "Dwarf 🧌", life: 30, weapon: weapons[3])
//]
