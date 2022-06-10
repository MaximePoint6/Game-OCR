//
//  main.swift
//  Game2
//
//  Created by Maxime Point on 03/06/2022.
//

import Foundation


// TODO: - Urgent
// Vérifier les fonctions d'attaques, essaye de les faire plus courte et plus claire,
// Mettre des fonctions dans les classes directement, + simple et certainement moins de parametres necessaires dans les fonctions du coup
// Faire en sorte lors du choix de l'USER soigner ou attaquer on puisse pas mettre autre chose que 1 ou 2
// Faire la documentation
// Et normalement c'est fini :)




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
