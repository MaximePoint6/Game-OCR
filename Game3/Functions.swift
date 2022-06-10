//
//  Functions.swift
//  Game3
//
//  Created by Maxime Point on 10/06/2022.
//

import Foundation

// MARK: - Functions

func welcome() {
    print("⚔️⚔️⚔️ Bonjour, commençons une nouvelle partie ! ⚔️⚔️⚔️")
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
    
    print("Bienvenue \(playerName) 🤝 - Veuillez choisir 3 personnages pour rejoindre votre équipe. Voici les personnages disponibles :")
    var counter = 1
    for combatantType in CombatantType.allCases {
        print("""
            Combattant \(counter) : \(combatantType.getName()) - Vie max : \(combatantType.getMaxHealth()) - Arme : \(combatantType.getWeapon().getName()) - Puissance de l'arme : \(combatantType.getWeapon().weaponStrength())
            """)
        counter += 1
    }
    print("----------")
    
    for i in 1...3 {
        if i == 1 {
            print("1️⃣ \(playerName), entrez le numéro du 1er personnage que vous souhaitez dans votre équipe.")
        } else if i == 2 {
            print("2️⃣ \(playerName), entrez le numéro du 2ème personnage que vous souhaitez dans votre équipe.")
        } else {
            print("3️⃣ \(playerName), entrez le numéro du denier personnage que vous souhaitez dans votre équipe.")
        }
        let choice = newCombatant()
        
        print("🗣 Quel surnom souhaitez-vous lui donner ?")
        let combatantName = nameVerification()
        
        let selectedCombatant = Combatant(type: CombatantType.allCases[choice-1], name: combatantName)
        combatants.append(selectedCombatant)
    }
    
    return combatants
}


func gameRecap(game: Game) {
    
    print("Voici un résumé du jeu")
    print("")
    
    for playerNumber in 0..<game.players.count {
        print("Equipe de \(game.players[playerNumber].playerName) :")
        
        playerCombatantsRecap(player: game.players[playerNumber])
//        for combatant in 0..<(game.players[playerNumber].playerTeam.count) {
//            print("""
//                Combattant \(combatant+1)- "\(game.players[playerNumber].playerTeam[combatant].name)" - Vie : \(game.players[playerNumber].playerTeam[combatant].currentHP) - Puissance : \(game.players[playerNumber].playerTeam[combatant].weapon.weaponStrength())
//                """)
//        }
    }
    print("----------")
    
}

func playerCombatantsRecap(player: Player) {
    
//    for combatant in 0..<(game.players[playerIndex].playerTeam.count) {
//        print("""
//            Combattant \(combatant+1)- "\(game.players[playerIndex].playerTeam[combatant].name)" - Vie : \(game.players[playerIndex].playerTeam[combatant].currentHP) - Puissance : \(game.players[playerIndex].playerTeam[combatant].weapon.weaponStrength())
//            """)
//    }
    
    for combatant in 0..<(player.playerTeam.count) {
        print("""
            Combattant \(combatant+1)- "\(player.playerTeam[combatant].name)" - vie : \(player.playerTeam[combatant].currentHP) - puissance : \(player.playerTeam[combatant].weapon.weaponStrength())
            """)
    }
    
}


func readInteger() -> Int {
    var readValue: Int?
    repeat {
        let rawValue = readText()
        if let value = Int(rawValue) {
            readValue = value
        } else {
            print("❌ Une valeur entière doit être saisie")
        }
    } while readValue == nil
    
    return readValue!
}


func readText() -> String {
    var text: String?
    repeat {
        text = readLine()
        if text == nil {
            print("❌ Un texte doit être saisi")
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
            print("❌ Vous n'avez pas rentré une bonne valeur, veuillez recommencer")
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
            print("❌ Ce nom est déjà utilisé par un autre combattant, veuillez en choisir un autre")
        }
    } while names.contains(name) == true
    
    Combatant.names.append(name)
    return name
    
}


func firstPlayerIndexToPlay(game: Game) -> Int {

    let randomInt = Int.random(in: 0..<Game.numbersOfPlayers)
    
    print("\(game.players[randomInt].playerName), tu as été tiré au sort pour commencer la partie ! 😃")

    return randomInt
}


func attack(by attackingPlayer: Player, against defensivePlayer: Player) -> Player {

    print("💪 \(attackingPlayer.playerName), entrez le numéro de votre combattant parmi cette selection :")
    let attackingCombatant = combatantIndexSelection(player: attackingPlayer)

    print("🫵 Maintenant, entrez le numéro du combattant adverse que vous souhaitez attaquer ? ")
    let combatantReceivingAnAttack = combatantIndexSelection(player: defensivePlayer)

    var newCombatantLife = defensivePlayer.playerTeam[combatantReceivingAnAttack].currentHP - attackingPlayer.playerTeam[attackingCombatant].weapon.weaponStrength()

    if newCombatantLife <= 0 {
        newCombatantLife = 0
        defensivePlayer.playerTeam[combatantReceivingAnAttack].currentHP = newCombatantLife
        defensivePlayer.deadCombatants.append(defensivePlayer.playerTeam[combatantReceivingAnAttack])
        defensivePlayer.playerTeam.remove(at: combatantReceivingAnAttack)
    } else {
        defensivePlayer.playerTeam[combatantReceivingAnAttack].currentHP = newCombatantLife
    }

    return defensivePlayer
}

func combatantIndexSelection(player: Player) -> Int {
    
    playerCombatantsRecap(player: player)

    var readValue: Int?
    repeat {
        let rawValue = readInteger()
        if rawValue <= player.playerTeam.count && rawValue > 0 {
            readValue = rawValue
        } else {
            readValue = nil
            print("❌ Vous n'avez pas rentré une bonne valeur, veuillez recommencer")
        }
    } while readValue == nil

    return readValue!-1
}



