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
    }
    
    let game = Game(players: players)
        
        
        
        
        
        
//        if player == 1 {
//            game.player1.playerName = choiceOfName(playerNumber: player)
//            game.player1.playerTeam = teamSelection(playerName: game.player1.playerName)
//        } else if player == 2 {
//            game.player2.playerName = choiceOfName(playerNumber: player)
//            game.player2.playerTeam = teamSelection(playerName: game.player2.playerName)
//        } else {
//            //
//        }
    resumeGame(game: game)
    
//    print("Le combat peut maintenant commencer !")
//    let firstPlayer = firstPlayerToPlay(game: game)
//
//    var attackingPlayer: Player
//    var defensivePlayer: Player
//    var currentPlayer = firstPlayer
//
//    repeat {
//        if currentPlayer.playerName == game.player1.playerName {
//            attackingPlayer = game.player1
//            defensivePlayer = game.player2
//            game.player2 = attack(attackingPlayer: attackingPlayer, defensivePlayer: defensivePlayer)
//            currentPlayer = game.player2
//        } else {
//            attackingPlayer = game.player2
//            defensivePlayer = game.player1
//            game.player1 = attack(attackingPlayer: attackingPlayer, defensivePlayer: defensivePlayer)
//            currentPlayer = game.player1
//        }
//        print("########### Tour suivant ###########")
//    } while game.player1.deadCombattants.count < 3 && game.player2.deadCombattants.count < 3
//
//    if game.player1.deadCombattants.count == 3 {
//        print("🎉🎉🎉 Bravo \(game.player2.playerName), tu as gagné cette partie")
//    } else {
//        print("🎉🎉🎉 Bravo \(game.player1.playerName), tu as gagné cette partie")
//    }
    
}
