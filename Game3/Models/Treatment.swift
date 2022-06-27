//
//  Treatment.swift
//  Game3
//
//  Created by Maxime Point on 10/06/2022.
//

import Foundation

enum Treatment {
    case None
    case MagicPotion
    
    public func getName() -> String {
        switch self {
        case .None: return "Aucun"
        case .MagicPotion: return "Potion magique"
        }
    }
    
    public func treatmentStrength() -> Int {
        switch self {
        case .None: return 0
        case .MagicPotion: return 5
        }
    }
}
