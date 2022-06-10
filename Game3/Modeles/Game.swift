//
//  Game.swift
//  Game3
//
//  Created by Maxime Point on 10/06/2022.
//

import Foundation

class Game {
    var players: [Player]
    
    required init(players: [Player]) {
        self.players = players
    }
    
    static let numbersOfPlayers = 2
}
