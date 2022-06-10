//
//  Functions.swift
//  Game3
//
//  Created by Maxime Point on 10/06/2022.
//

import Foundation

//======================
// MARK: - General functions
//======================

func welcome() {
    print("⚔️⚔️⚔️ Bonjour, commençons une nouvelle partie ! ⚔️⚔️⚔️")
}


func gameRecap(game: Game) {
    print("Voici un résumé du jeu")
    print("")
    for playerNumber in 0..<game.players.count {
        print("Equipe de \(game.players[playerNumber].playerName) :")
        playerCombatantsRecap(player: game.players[playerNumber])
    }
    print("----------")
}


func playerCombatantsRecap(player: Player) {
    for combatant in 0..<(player.playerTeam.count) {
        print("""
            Combattant \(combatant+1)- "\(player.playerTeam[combatant].name)" - vie : \(player.playerTeam[combatant].currentHP) - puissance de l'arme : \(player.playerTeam[combatant].weapon.weaponStrength()) - Puissance du traitement : \(player.playerTeam[combatant].treatment.treatmentStrength()))
            """)
    }
}


func winner(game: Game, numberOfTurns: Int) {
    let winnerName: Player
    
    if game.players[0].teamIsAlive == true {
        winnerName = game.players[0]
    } else {
        winnerName = game.players[1]
    }
    print("---------- La partie est finie ! ----------")
    print("🎉🎉🎉 Bravo \(winnerName.playerName), vous avez gagné cette partie en \(numberOfTurns / 2) attaques ! 🎉🎉🎉")
    print("Voici les combattants encore vivants 💪 :")
    playerCombatantsRecap(player: winnerName)
}


//======================
// MARK: - Player functions
//======================

func choiceOfName(playerNumber: Int) -> String {
    print("Joueur \(playerNumber) - Quel est votre prénom ?")
    return readText()
}

/// Description
/// - Parameter playerName: playerName description
/// - Returns: description
func teamSelection(playerName: String) -> [Combatant] {
    var combatants = [Combatant]()
    print("Bienvenue \(playerName) 🤝 - Veuillez choisir \(Player.numberOfCombatants) personnages pour rejoindre votre équipe. Voici les personnages disponibles :")
    var counter = 1
    
    for combatantType in CombatantType.allCases {
        print("""
            Combattant \(counter) : \(combatantType.getName()) - Vie max : \(combatantType.getMaxHealth()) - Arme : \(combatantType.getWeapon().getName()) - Puissance de l'arme : \(combatantType.getWeapon().weaponStrength()) - puissance du traitement : \(combatantType.getTreatment().treatmentStrength())
            """)
        counter += 1
    }
    
    print("----------")
    
    for i in 1...Player.numberOfCombatants {
        print("\(playerName), entrez le numéro du personnage que vous souhaitez dans votre équipe (combattant n°\(i) sur \(Player.numberOfCombatants) rejoignant votre équipe)")
        let choice = newCombatant()
        
        print("🗣 Quel surnom souhaitez-vous lui donner ?")
        let combatantName = nameVerification()
        let selectedCombatant = Combatant(type: CombatantType.allCases[choice-1], name: combatantName)
        combatants.append(selectedCombatant)
    }
    
    return combatants
}


//======================
// MARK: - User interface functions
//======================

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
    let names = Combatant.namesUsed
    var name: String
    
    repeat {
        name = readText().uppercased()
        if names.contains(name) {
            print("❌ Ce nom est déjà utilisé par un autre combattant, veuillez en choisir un autre")
        }
    } while names.contains(name) == true
    Combatant.namesUsed.append(name)
    
    return name
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


//======================
// MARK: - Combat functions
//======================

func firstPlayerIndexToPlay(game: Game) -> Int {
    let randomInt = Int.random(in: 0..<Game.numbersOfPlayers)
    print("\(game.players[randomInt].playerName), Vous avez été tiré au sort pour commencer la partie ! 😃")
    return randomInt
}


func combat(game: Game) {
    var attackingPlayerIndex = firstPlayerIndexToPlay(game: game)
    var defendingPlayerIndex: Int
    var numberOfTurns: Int = 0
    
    repeat {
        numberOfTurns += 1
        print("---------- Tour n°\(numberOfTurns) ----------")
        if attackingPlayerIndex == 0 {
            attackOrTreatment(by: game.players[0], against: game.players[1])
            attackingPlayerIndex = 1
            defendingPlayerIndex = 0
        } else {
            attackOrTreatment(by: game.players[1], against: game.players[0])
            attackingPlayerIndex = 0
            defendingPlayerIndex = 1
        }
    } while game.players[defendingPlayerIndex].teamIsAlive == true && game.players[attackingPlayerIndex].teamIsAlive == true
    
    winner(game: game, numberOfTurns: numberOfTurns)
}


func attackOrTreatment(by attackingPlayer: Player, against defensivePlayer: Player) {
    print("💪 \(attackingPlayer.playerName), entrez le numéro de votre combattant parmi cette selection :")
    let activeCombatantIndex = combatantIndexSelection(player: attackingPlayer)
    
    if attackingPlayer.playerTeam[activeCombatantIndex].treatment != .None {
        print("👉 Ce combatant possede un traitement pour soigner un de vos combattants, que souhaitez-vous faire : 1- Soigner 🚑 ou 2- Attaquer ⚔️ ?")
        let choice = readInteger()
        if choice == 1 {
            care(for: attackingPlayer, activeCombatantIndex: activeCombatantIndex)
        } else {
            attack(by: attackingPlayer, against: defensivePlayer, activeCombatantIndex: activeCombatantIndex)
        }
    } else {
        attack(by: attackingPlayer, against: defensivePlayer, activeCombatantIndex: activeCombatantIndex)
    }
}

func attack(by attackingPlayer: Player, against defensivePlayer: Player, activeCombatantIndex : Int) {
    print("🫵 Maintenant, entrez le numéro du combattant adverse que vous souhaitez attaquer ? ")
    let combatantReceivingAnAttack = combatantIndexSelection(player: defensivePlayer)
    
    let newCombatantLife = defensivePlayer.playerTeam[combatantReceivingAnAttack].currentHP - attackingPlayer.playerTeam[activeCombatantIndex].weapon.weaponStrength()
    
    if newCombatantLife <= 0 {
        defensivePlayer.playerTeam[combatantReceivingAnAttack].currentHP = 0
        defensivePlayer.playerTeam.remove(at: combatantReceivingAnAttack)
        if defensivePlayer.playerTeam.count <= 0 {
            defensivePlayer.teamIsAlive = false
        }
    } else {
        defensivePlayer.playerTeam[combatantReceivingAnAttack].currentHP = newCombatantLife
    }
}

func care(for attackingPlayer: Player, activeCombatantIndex : Int) {
    print("🚑 Super le traitment est prêt, entrez le numéro du combattant de votre équipe que vous souhaitez soigner ? ")
    let combatantReceivingTreatment = combatantIndexSelection(player: attackingPlayer)
    
    let newCombatantLife = attackingPlayer.playerTeam[combatantReceivingTreatment].currentHP + attackingPlayer.playerTeam[activeCombatantIndex].weapon.weaponStrength()
    
    if newCombatantLife > attackingPlayer.playerTeam[combatantReceivingTreatment].type.getMaxHealth() {
        attackingPlayer.playerTeam[combatantReceivingTreatment].currentHP = attackingPlayer.playerTeam[combatantReceivingTreatment].type.getMaxHealth()
    } else {
        attackingPlayer.playerTeam[combatantReceivingTreatment].currentHP = newCombatantLife
    }
}
