//
//  User.swift
//  Game3
//
//  Created by Maxime Point on 17/06/2022.
//

import Foundation

class User {
    
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


    static func combatantNameVerification() -> String {
        let names = Combatant.namesUsed
        var name: String?
        repeat {
            name = readText().uppercased()
            if names.contains(name!) {
                print("❌ Ce nom est déjà utilisé par un autre combattant, veuillez en choisir un autre")
                name = nil
            }
        } while name == nil // Attention ca fait une double boucle du coup avec name.contains(name), on verifie la et sur le if pas top niveau perf
        Combatant.namesUsed.append(name!)
        return name!
    }
  
}
