//
//  main.swift
//  Game2
//
//  Created by Maxime Point on 03/06/2022.
//

import Foundation

// MARK: - Main

// Faire diagramme de classe et le mettre dans le powerpoint puis dans le dossier livrable pour le mentor

mainFunction()

func mainFunction() {
    let game = Game()
    
    game.welcome()
    game.playersSettings()
    game.gameRecap()
    print("💥💥💥 Le combat peut maintenant commencer ! 💥💥💥")
    game.combat()
}

