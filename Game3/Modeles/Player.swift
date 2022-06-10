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
    var deadCombatants: [Combatant]
    
    required init(playerName: String, playerTeam: [Combatant], deadCombatants: [Combatant] = []) {
        self.playerName = playerName
        self.playerTeam = playerTeam
        self.deadCombatants = deadCombatants
    }
    
    
}
