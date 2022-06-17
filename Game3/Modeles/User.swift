//
//  User.swift
//  Game3
//
//  Created by Maxime Point on 17/06/2022.
//

import Foundation

class User {
    
//===============================================
// MARK: - User interactions, general functions
//===============================================
    
    /// Check that the user indicates an integer, if this is not the case, an error message is displayed.
    /// - Returns: Integer
    static func readInteger() -> Int {
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

    
    /// Check that the user indicates a string, if this is not the case, an error message is displayed.
    /// - Returns: String
    static func readText() -> String {
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
    
    /// Check that the user indicates choice 1 or choice 2, if this is not the case, an error message is displayed.
    /// - Returns: Integer
    static func select1or2() -> Int {
        var readValue: Int?
        repeat {
            let rawValue = readInteger()
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
    static func combatantNameVerification() -> String {
        let names = Combatant.namesUsed
        var name: String?
        repeat {
            name = readText().uppercased()
            if names.contains(name!) {
                print("❌ Ce nom est déjà utilisé par un autre combattant, veuillez en choisir un autre")
                name = nil
            }
        } while name == nil
        Combatant.namesUsed.append(name!)
        return name!
    }
  
}
