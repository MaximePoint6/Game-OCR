//
//  Functions.swift
//  Game3
//
//  Created by Maxime Point on 10/06/2022.
//

import Foundation

// MARK: - Functions

func welcome() {
    print("Bonjour, commençons une nouvelle partie !")
}


func choiceOfName(playerNumber: Int) -> String {
    print("Joueur \(playerNumber) - Quel est votre prénom ?")
    return readText()
}


/// Description
/// - Parameter playerName: playerName description
/// - Returns: description
func teamSelection(playerName: String) -> [Combatant] {
    
    var combatants = [Combatant]()
    
    print("Bienvenue \(playerName) - Veuillez choisir 3 personnages pour rejoindre votre équipe. Voici les personnages disponibles :")
    var counter = 1
    for combatantType in CombatantType.allCases {
        print("""
            Combatant \(counter) : \(combatantType.getName()) - Max health : \(combatantType.getMaxHealth()) - Weapon : \(combatantType.getWeapon().getName()) - Weapon Strenght : \(combatantType.getWeapon().weaponStrength())
            """)
        counter += 1
    }
    
    for i in 1...3 {
        if i == 1 {
            print("\(playerName) - Entrez le numéro du 1er personnage que vous souhaitez dans votre équipe.")
        } else if i == 2 {
            print("\(playerName) - Entrez le numéro du 2ème personnage que vous souhaitez dans votre équipe.")
        } else {
            print("\(playerName) - Entrez le numéro du denier personnage que vous souhaitez dans votre équipe.")
        }
        let choice = newCombatant()
        
        print("Quel surnom souhaitez-vous lui donner ?")
        let combatantName = nameVerification()
        
        let selectedCombatant = Combatant(type: CombatantType.allCases[choice-1], name: combatantName)
        combatants.append(selectedCombatant)
    }
    
    return combatants
}


func resumeGame(game: Game) {
    
    print("Voici un résumé du jeu")
    print("----------")
    
    for playerNumber in 0..<game.players.count {
        print("Equipe de \(game.players[playerNumber].playerName) :")
        for combatant in 0..<(game.players[playerNumber].playerTeam.count) {
            print("""
                Combattant \(combatant+1)- "\(game.players[playerNumber].playerTeam[combatant].name)" - vie : \(game.players[playerNumber].playerTeam[combatant].currentHP) - puissance : \(game.players[playerNumber].playerTeam[combatant].weapon.weaponStrength())
                """)
        }
    }
    
}


func readInteger() -> Int {
    var readValue: Int?
    repeat {
        let rawValue = readText()
        if let value = Int(rawValue) {
            readValue = value
        } else {
            print("Une valeur entière doit être saisie")
        }
    } while readValue == nil
    
    return readValue!
}


func readText() -> String {
    var text: String?
    repeat {
        text = readLine()
        if text == nil {
            print("Un texte doit être saisi")
        }
    } while text == nil
    
    return text!
}


func newCombatant() -> Int {
    var readValue: Int?
    repeat {
        let rawValue = readInteger()
        if rawValue <= CombatantType.allCases.count && rawValue > 0 {
            readValue = rawValue
        } else {
            readValue = nil
            print("Vous n'avez pas rentré une bonne valeur, veuillez recommencer")
        }
    } while readValue == nil
    
    return readValue!
}


func nameVerification() -> String {
    
    let names = Combatant.names
    
    var name: String
    repeat {
        name = readText().uppercased()
        if names.contains(name) {
            print("Ce nom est déjà utilisé par un autre combattant, veuillez en choisir un autre")
        }
    } while names.contains(name) == true
    
    Combatant.names.append(name)
    return name
    
}


//func firstPlayerToPlay(game: Game) -> Player {
//    
//    var player: Player
//    let randomInt = Int.random(in: 1...Game.numbersOfPlayers)
//    
//    player = game.players[randomInt]
//    print("\(player.playerName), tu as été tiré au sort pour commencer la partie !")
//    
//    return player
//}


//func attack(attackingPlayer: Player, defensivePlayer: Player) -> Player {
//
//    print("\(attackingPlayer.playerName), entrez le numéro de votre combattant parmi cette selection :")
//    let attackingCombatant = combatantSelection(player: attackingPlayer)
//
//    print("Maintenant, entrez le numéro du combattant adverse que vous souhaitez attaquer ?")
//    let combatantReceivingAnAttack = combatantSelection(player: defensivePlayer)
//
//    var newlife = defensivePlayer.playerTeam[combatantReceivingAnAttack-1].combatantType.life - attackingPlayer.playerTeam[attackingCombatant-1].combatantType.weapon.weaponStrength
//
//    if newlife <= 0 {
//        newlife = 0
//        defensivePlayer.playerTeam[combatantReceivingAnAttack-1].combatantType.life = newlife
//        defensivePlayer.deadCombattants.append(defensivePlayer.playerTeam[combatantReceivingAnAttack-1])
//        defensivePlayer.playerTeam.remove(at: combatantReceivingAnAttack-1)
//    } else {
//        defensivePlayer.playerTeam[combatantReceivingAnAttack-1].combatantType.life = newlife
//    }
//
//    return defensivePlayer
//}
//
//func combatantSelection(player: Player) -> Int {
//
//    for combatant in 0...(player.playerTeam.count)-1 {
//        print("""
//            Combattant \(combatant+1)- "\(player.playerTeam[combatant].combatantName)" - vie : \(player.playerTeam[combatant].combatantType.life) - puissance : \(player.playerTeam[combatant].combatantType.weapon.weaponStrength)
//            """)
//    }
//
//    var readValue: Int?
//    repeat {
//        let rawValue = readInteger()
//        if rawValue <= player.playerTeam.count && rawValue > 0 {
//            readValue = rawValue
//        } else {
//            readValue = nil
//            print("Vous n'avez pas rentré une bonne valeur, veuillez recommencer")
//        }
//    } while readValue == nil
//
//    return readValue!
//}



