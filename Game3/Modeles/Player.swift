//
//  Player.swift
//  Game3
//
//  Created by Maxime Point on 10/06/2022.
//

import Foundation

class Player: Identifiable {
    let id = UUID()
    var playerName: String
    var playerTeam: [Combatant]
    var teamIsAlive: Bool
    
    static let numberOfCombatants = 3
    
    init(playerName: String, playerTeam: [Combatant], teamIsAlive: Bool = true) {
        self.playerName = playerName
        self.playerTeam = playerTeam
        self.teamIsAlive = teamIsAlive
    }
    
//    ===============================
//     MARK: - Player Functions
//    ===============================
    
    func playerCombatantsRecap() {
        for combatant in 0..<(self.playerTeam.count) {
            print("""
                Combattant \(combatant+1)- "\(self.playerTeam[combatant].name)" - vie : \(self.playerTeam[combatant].currentHP) - puissance de l'arme : \(self.playerTeam[combatant].weapon.weaponStrength()) - Puissance du traitement : \(self.playerTeam[combatant].treatment.treatmentStrength()))
                """)
        }
    }
    
    func attackOrTreatmentParameter(against defensivePlayer: Player) {
        print("💪 \(self.playerName), entrez le numéro de votre combattant parmi cette selection :")
        let activeCombatant = combatantSelection()
        if activeCombatant.treatment != .None {
            print("👉 Ce combatant possede un traitement pour soigner un de vos combattants, que souhaitez-vous faire : 1- Soigner 🚑 ou 2- Attaquer ⚔️ ?")
            let choice = User.select1or2()
            if choice == 1 {
                activeCombatant.care(by: self)
            } else {
                activeCombatant.attack(against: defensivePlayer)
            }
        } else {
            activeCombatant.attack(against: defensivePlayer)
        }
    }
    
    func combatantSelection() -> Combatant {
        playerCombatantsRecap()
        var readValue: Int?
        repeat {
            let rawValue = User.readInteger()
            if rawValue <= playerTeam.count && rawValue > 0 {
                readValue = rawValue
            } else {
                readValue = nil
                print("❌ Vous n'avez pas rentré une bonne valeur, veuillez recommencer")
            }
        } while readValue == nil
        
        return self.playerTeam[readValue!-1]
    }

}
