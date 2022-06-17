//
//  Game.swift
//  Game3
//
//  Created by Maxime Point on 10/06/2022.
//

import Foundation

class Game {
    var players: [Player] = []
    
    static let numbersOfPlayers = 2
    
    func welcome() {
        print("⚔️⚔️⚔️ Bonjour, commençons une nouvelle partie ! ⚔️⚔️⚔️")
    }
    
//======================
// MARK: - PlayersSettings
//======================
    
    func playersSettings () {
        for playerNumber in 1...Game.numbersOfPlayers {
            let playerName = choiceOfName(playerNumber: playerNumber)
            let playerTeam = teamSelection(playerName: playerName)
            self.players.append(Player(playerName: playerName, playerTeam: playerTeam))
            print("----------")
        }
    }
    
    func choiceOfName(playerNumber: Int) -> String {
        print("Joueur \(playerNumber) - Quel est votre prénom ?")
        return User.readText()
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
            let choice = User.combatantChoiceToJoinTheTeam()
            
            print("🗣 Quel surnom souhaitez-vous lui donner ?")
            let combatantName = User.combatantNameVerification()
            let selectedCombatant = Combatant(type: CombatantType.allCases[choice-1], name: combatantName)
            combatants.append(selectedCombatant)
        }
        return combatants
    }
    
//===============================
// MARK: - GameSettings & Recap
//===============================
    
    func gameRecap() {
        print("Voici un résumé du jeu")
        print("")
        for playerNumber in 0..<self.players.count {
            print("Equipe de \(self.players[playerNumber].playerName) :")
            self.players[playerNumber].playerCombatantsRecap()
        }
        print("----------")
    }
    
    func combat() {
        var attackingPlayer = firstPlayerToPlay()
        var defendingPlayer: Player
        var roundNumber: Int = 0
        repeat {
            roundNumber += 1
            print("---------- Tour n°\(roundNumber) ----------")
            if attackingPlayer.id == self.players[0].id {
                attackingPlayer.attackOrTreatmentParameter(against: self.players[1])
                attackingPlayer = self.players[1]
                defendingPlayer = self.players[0]
            } else {
                attackingPlayer.attackOrTreatmentParameter(against: self.players[0])
                attackingPlayer = self.players[0]
                defendingPlayer = self.players[1]
            }
        } while defendingPlayer.teamIsAlive == true && attackingPlayer.teamIsAlive == true
        winner(roundNumber: roundNumber)
    }
    
    func firstPlayerToPlay() -> Player {
        let randomInt = Int.random(in: 0..<Game.numbersOfPlayers)
        print("\(self.players[randomInt].playerName), Vous avez été tiré au sort pour commencer la partie ! 😃")
        return self.players[randomInt]
    }
    
    func winner(roundNumber: Int) {
        let winner: Player
        if self.players[0].teamIsAlive == true {
            winner = self.players[0]
        } else {
            winner = self.players[1]
        }
        print("---------- La partie est finie ! ----------")
        print("🎉🎉🎉 Bravo \(winner.playerName), vous avez gagné cette partie en \(roundNumber / 2) attaques ! 🎉🎉🎉")
        print("Voici les combattants encore vivants dans ton équipe 💪 :")
        winner.playerCombatantsRecap()
    }
    
}
