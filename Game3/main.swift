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
    let game = Game()
    
    game.welcome()
    game.playersSettings()
    game.gameRecap()
    print("💥💥💥 Le combat peut maintenant commencer ! 💥💥💥")
    game.combat()
}

