//
//  main.swift
//  Game2
//
//  Created by Maxime Point on 03/06/2022.
//

import Foundation

// MARK: - Main

mainFunction()

func mainFunction() {
    
    welcome()
    
    var allPlayers = [Player]()
    
    for playerNumber in 1...Game.numbersOfPlayers {
        let playerName = choiceOfName(playerNumber: playerNumber)
        let playerTeam = teamSelection(playerName: playerName)
        let player = Player(playerName: playerName, playerTeam: playerTeam)
        allPlayers.append(player)
        print("----------")
    }
    let game = Game(players: allPlayers)
        
    gameRecap(game: game)
    
    print("💥💥💥 Le combat peut maintenant commencer ! 💥💥💥")
    
    combat(game: game)
}
