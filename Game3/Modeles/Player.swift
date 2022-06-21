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
    var attacksReceived: Int
    var treatmentsReceived: Int
    
    static let numberOfCombatants = 3
    
    init(playerName: String, playerTeam: [Combatant], teamIsAlive: Bool = true, attacksReceived: Int = 0, treatmentsReceived: Int = 0) {
        self.playerName = playerName
        self.playerTeam = playerTeam
        self.teamIsAlive = teamIsAlive
        self.attacksReceived = attacksReceived
        self.treatmentsReceived = treatmentsReceived
    }
    
//    ===============================
//     MARK: - Player Functions
//    ===============================
    
    /// Function displaying team summary
    func playerCombatantsRecap() {
        for combatant in 0..<(self.playerTeam.count) {
            print("""
                Combattant \(combatant+1)- "\(self.playerTeam[combatant].name)" // Vie : \(self.playerTeam[combatant].currentHP) // Puissance de l'arme : \(self.playerTeam[combatant].weapon.weaponStrength()) // Puissance du traitement : \(self.playerTeam[combatant].treatment.treatmentStrength()).
                """)
        }
    }
    
    /// Function allowing the player to choose his fighter and to choose the action (treatment or attack).
    /// - Parameter defensivePlayer: "defensive player": who receives the attack
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
    
    /// Function displaying the player's combatants and allowing the player to choose their combatant. The function checks if the user has entered a good value to select his combatant, otherwise an error message is displayed)
    /// - Returns: Combatant
    func combatantSelection() -> Combatant {
        playerCombatantsRecap()
        var readValue: Int?
        repeat {
            let rawValue = User.enterInteger()
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
