//
//  main.swift
//  Game2
//
//  Created by Maxime Point on 03/06/2022.
//

import Foundation


// TODO: - Urgent
// Faire la documentation
// Mettre qq commentaires
// Et normalement c'est fini :)

// Pour la fonction ou on verifie les noms des combattants : utilisrr plutot .map etc


// MARK: - Main

mainFunction()


func mainFunction() {
    let game = Game()
    
    game.welcome()
    game.playersSettings()
    game.gameRecap()
    print("💥💥💥 Le combat peut maintenant commencer ! 💥💥💥")
    game.combat()
}
