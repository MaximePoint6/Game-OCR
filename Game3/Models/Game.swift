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
    
    //======================
    // MARK: - PlayersSettings
    //======================
    
    
    /// Function with a loop based on the number of players in the game. Allows players to choose their name and teams.
    func playersSettings () {
        for playerNumber in 1...Game.numbersOfPlayers {
            let playerName = choiceOfName(playerNumber: playerNumber)
            let playerTeam = teamSelection(playerName: playerName)
            self.players.append(Player(playerName: playerName, playerTeam: playerTeam))
            print("----------")
        }
    }
    
    /// Function allowing the player to choose his nickname
    func choiceOfName(playerNumber: Int) -> String {
        print("Joueur \(playerNumber) - Quel est votre prénom ?")
        return UserEntryManager.enterText()
    }
    
    /// Function allowing the player to select the combatants joining his team
    /// - Parameter playerName: player name
    /// - Returns: table of fighters corresponding to the player team
    func teamSelection(playerName: String) -> [Combatant] {
        var combatants = [Combatant]()
        print("Bienvenue \(playerName) 🤝 - Veuillez choisir \(Player.numberOfCombatants) personnages pour rejoindre votre équipe. Voici les personnages disponibles :")
        var counter = 1
        
        for combatantType in CombatantType.allCases {
            print("""
                Combattant \(counter) : \(combatantType.getName()) // Vie max : \(combatantType.getMaxHealth()) // Arme : \(combatantType.getWeapon().getName()) // Puissance de l'arme : \(combatantType.getWeapon().weaponStrength()) // Puissance du traitement : \(combatantType.getTreatment().treatmentStrength()).
                """)
            counter += 1
        }
        
        print("----------")
        
        for i in 1...Player.numberOfCombatants {
            print("\(playerName), entrez le numéro du personnage que vous souhaitez dans votre équipe (combattant n°\(i) sur \(Player.numberOfCombatants) rejoignant votre équipe)")
            let choice = UserEntryManager.combatantChoiceToJoinTheTeam()
            
            print("🗣 Quel surnom souhaitez-vous lui donner ?")
            let combatantName = UserEntryManager.combatantNameVerification(game: self)
            let selectedCombatant = Combatant(type: CombatantType.allCases[choice-1], name: combatantName)
            combatants.append(selectedCombatant)
        }
        return combatants
    }
    
    /// Function allowing to return an array with the names of all the combatants in the game.
    /// - Returns: array with the names of all the combatants in the game
    func getAllCombatantsNames() -> [String] {
        return self.players.flatMap { $0.playerTeam }
            .map { $0.name }
            .sorted { $0 > $1 }
    }
    
    //===============================
    // MARK: - GameSettings & Recap
    //===============================
    
    /// Function displaying a welcome message
    func welcome() {
        print("⚔️⚔️⚔️ Bonjour, commençons une nouvelle partie ! ⚔️⚔️⚔️")
    }
    
    /// Function displaying teams summary
    func gameRecap() {
        print("Voici un résumé du jeu")
        print("")
        for playerNumber in 0..<self.players.count {
            print("Equipe de \(self.players[playerNumber].playerName) :")
            self.players[playerNumber].playerCombatantsRecap()
        }
        print("----------")
    }
    
    /// Function starting the fight, which allows players to take turns, and which continues as long as there is no losing team
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
    
    /// Function determining the first player in the game (randomly)
    /// - Returns: first player
    func firstPlayerToPlay() -> Player {
        let randomInt = Int.random(in: 0..<Game.numbersOfPlayers)
        print("\(self.players[randomInt].playerName), Vous avez été tiré au sort pour commencer la partie ! 😃")
        return self.players[randomInt]
    }
    
    /// Function displaying the winner and the game statistics
    /// - Parameter roundNumber: roundNumber
    func winner(roundNumber: Int) {
        let winner: Player
        let looser: Player
        if self.players[0].teamIsAlive == true {
            winner = self.players[0]
            looser = self.players[1]
        } else {
            winner = self.players[1]
            looser = self.players[0]
        }
        print("""
        
        
        ##   ##   ####      ####   ######    #####    ####    ######   #######             ##
        ##   ##    ##      ##  ##  # ## #   ##   ##    ##      ##  ##   ##   #            ####
         ## ##     ##     ##         ##     ##   ##    ##      ##  ##   ## #              ####
         ## ##     ##     ##         ##     ##   ##    ##      #####    ####               ##
          ###      ##     ##         ##     ##   ##    ##      ## ##    ## #               ##
          ###      ##      ##  ##    ##     ##   ##    ##      ##  ##   ##   #
           #      ####      ####    ####     #####    ####    #### ##  #######             ##

        🎉🎉🎉 Bravo \(winner.playerName), vous avez gagné cette partie en \((roundNumber / 2) + 1) attaques ! 🎉🎉🎉

""")
        print("Voici vos combattants survivants après ce combat 💪 :")
        winner.playerCombatantsRecap()
        print("""
        Et voici, les stastitiques de la partie 📊 :
        Équipe de \(winner.playerName) :
        ⚔️ Attaques subies (en points de vie) : \(winner.attacksReceived) pts.
        🚑 Traitements reçus (en points de vie) : \(winner.treatmentsReceived) pts.
        Équipe de \(looser.playerName) :
        ⚔️ Attaques subies (en points de vie) : \(looser.attacksReceived) pts.
        🚑 Traitements reçus (en points de vie) : \(looser.treatmentsReceived) pts.
        """)
    }
    
}
