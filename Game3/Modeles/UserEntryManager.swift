//
//  UserEntryManager.swift
//  Game3
//
//  Created by Maxime Point on 17/06/2022.
//

import Foundation

class UserEntryManager {
    
    //===============================================
    // MARK: - User interactions, general functions
    //===============================================
    
    /// Check that the user indicates an integer, if this is not the case, an error message is displayed.
    /// - Returns: Integer
    static func enterInteger() -> Int {
        var readValue: Int?
        repeat {
            let rawValue = enterText()
            if let value = Int(rawValue) {
                readValue = value
            } else {
                print("❌ Une valeur entière doit être saisie")
            }
        } while readValue == nil
        return readValue!
    }
    
    
    /// Check that the user indicates a string, if this is not the case, an error message is displayed.
    /// - Returns: String
    static func enterText() -> String {
        var text: String?
        repeat {
            text = readLine()
            if text == nil {
                print("❌ Un texte doit être saisi")
            }
        } while text == nil
        return text!
    }
    
    //===============================================
    // MARK: - User interactions, specific functions
    //===============================================
    
    /// Check that the user indicates an existing combatant type number, if this is not the case, an error message is displayed.
    /// - Returns: Integer
    static func combatantChoiceToJoinTheTeam() -> Int {
        var readValue: Int?
        repeat {
            let rawValue = enterInteger()
            if rawValue <= CombatantType.allCases.count && rawValue > 0 {
                readValue = rawValue
            } else {
                readValue = nil
                print("❌ Vous n'avez pas rentré une bonne valeur, veuillez recommencer")
            }
        } while readValue == nil
        return readValue!
    }
    
    /// Check that the user indicates choice 1 or choice 2, if this is not the case, an error message is displayed.
    /// - Returns: Integer
    static func select1or2() -> Int {
        var readValue: Int?
        repeat {
            let rawValue = enterInteger()
            if rawValue <= 2 && rawValue > 0 {
                readValue = rawValue
            } else {
                readValue = nil
                print("❌ Vous n'avez pas rentré une bonne valeur, veuillez recommencer")
            }
        } while readValue == nil
        return readValue!
    }
    
    /// Checks that the user chooses a name that doesn't already exist, if this is not the case, an error message is displayed.
    /// - Returns: String
    static func combatantNameVerification(game: Game) -> String {
        var name: String?
        repeat {
            name = enterText().uppercased()
            if  game.getAllCombatantsNames().contains(name!) {
                print("❌ Ce nom est déjà utilisé par un autre combattant, veuillez en choisir un autre")
                name = nil
            }
        } while name == nil
        return name!
    }
}
