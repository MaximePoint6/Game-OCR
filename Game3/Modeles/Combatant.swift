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
    
    init(type: CombatantType, name: String) {
        self.type = type
        self.currentHP = type.getMaxHealth()
        self.name = name
        self.weapon = type.getWeapon()
        self.treatment = type.getTreatment()
    }
    
//    ===============================
//     MARK: - Combatant Functions
//    ===============================
    
    /// Function launching an attack and allowing to choose the enemy combatant to attack and reduce his life according to the strength of the weapon.
    /// - Parameter defensivePlayer: "defensive player": who receives the attack
    func attack(against defensivePlayer: Player) {
        print("🫵 Maintenant, entrez le numéro du combattant adverse que vous souhaitez attaquer ? ")
        let combatantReceivingAnAttack = defensivePlayer.combatantSelection()
        
        let attackPoints = min(combatantReceivingAnAttack.currentHP, self.weapon.weaponStrength())
        combatantReceivingAnAttack.currentHP -= attackPoints
        if combatantReceivingAnAttack.currentHP <= 0 {
            if let index = defensivePlayer.playerTeam.firstIndex(where: {$0 === combatantReceivingAnAttack}) {
                defensivePlayer.playerTeam.remove(at: index)
            }
            if defensivePlayer.playerTeam.count <= 0 {
                defensivePlayer.teamIsAlive = false
            }
        }
        defensivePlayer.attacksReceived += attackPoints
        print("⚔️ \(combatantReceivingAnAttack.name) a perdu \(attackPoints) point(s) de vie suite à l'attaque du combattant \(self.name).")
    }
    
    /// Function launching a treatment and allowing to choose the combatant to heal and to increase his life according to the strength of the treatment.
    /// - Parameter player: Player giving treatment to one of his fighters
    func care(by player: Player) {
        print("🚑 Super le traitment est prêt, entrez le numéro du combattant de votre équipe que vous souhaitez soigner ? ")
        let combatantReceivingTreatment = player.combatantSelection()
        
        let newLife = combatantReceivingTreatment.currentHP + self.weapon.weaponStrength()
        let maxHealth = combatantReceivingTreatment.type.getMaxHealth()
        let treatmentPoints = min(newLife, maxHealth) - combatantReceivingTreatment.currentHP
        combatantReceivingTreatment.currentHP += treatmentPoints
        player.treatmentsReceived += treatmentPoints
        print("❤️ \(combatantReceivingTreatment.name) a gagné \(treatmentPoints) point(s) de vie grâce au soin du combattant \(self.name).")
    }
    
}
