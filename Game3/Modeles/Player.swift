//
//  Player.swift
//  Game3
//
//  Created by Maxime Point on 10/06/2022.
//

import Foundation

class Player {
    var playerName: String
    var playerTeam: [Combatant]
    var teamIsAlive: Bool
    
    required init(playerName: String, playerTeam: [Combatant], teamIsAlive: Bool = true) {
        self.playerName = playerName
        self.playerTeam = playerTeam
        self.teamIsAlive = teamIsAlive
    }
    
    static let numberOfCombatants = 3
    
    func choiceOfName(playerNumber: Int) -> String {
        print("Joueur \(playerNumber) - Quel est votre prénom ?")
        return readText()
    }
}
