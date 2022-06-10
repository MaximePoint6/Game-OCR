//
//  main.swift
//  Game2
//
//  Created by Maxime Point on 03/06/2022.
//

import Foundation



// Probleme au niveau des attacks, un combatant peut avoir une vie à 0 par moment bizarre, et voir même la vie peut etre moindre d'un coup alors qu
//'il y a pas eu d'attaque. Probleme de tableau je pense


// MARK: - Main

mainFunction()

func mainFunction() {
    
    welcome()
    
    var players = [Player]()
    var playerName: String
    var playerTeam: [Combatant]
    
    for playerNumber in 1...Game.numbersOfPlayers {
        playerName = choiceOfName(playerNumber: playerNumber)
        playerTeam = teamSelection(playerName: playerName)
        
        let player = Player(playerName: playerName, playerTeam: playerTeam)
        players.append(player)
        print("----------")
    }
    
    let game = Game(players: players)
        
    gameRecap(game: game)
    
    print("💥💥💥 Le combat peut maintenant commencer ! 💥💥💥")
    let firstPlayerIndex = firstPlayerIndexToPlay(game: game)
    var attackingPlayerIndex = firstPlayerIndex
    var defendingPlayerIndex: Int
    var numberOfTurns: Int = 0

    repeat {
        if attackingPlayerIndex == 0 {
            game.players[1] = attack(by: game.players[0], against: game.players[1])
            attackingPlayerIndex = 1
            defendingPlayerIndex = 0
        } else {
            game.players[0] = attack(by: game.players[1], against: game.players[0])
            attackingPlayerIndex = 0
            defendingPlayerIndex = 1
        }
        numberOfTurns += 1
        print("---------- Tour suivant ----------")
    } while game.players[defendingPlayerIndex].deadCombatants.count < 3 && game.players[attackingPlayerIndex].deadCombatants.count < 3

    if game.players[0].deadCombatants.count == 3 {
        print("🎉🎉🎉 Bravo \(game.players[1].playerName), tu as gagné cette partie en \(numberOfTurns / 2) tours ! 🎉🎉🎉")
    } else {
        print("🎉🎉🎉 Bravo \(game.players[0].playerName), tu as gagné cette partie en \(numberOfTurns / 2) tours ! 🎉🎉🎉")
    }    
}
