//
//  Card.swift
//  Veracruz
//
//  Created by Amarjit on 30/10/2025.
//

import Foundation

public enum CargoType: Int, CaseIterable {
    case gold, silver, stone, cocoa, corn, empty
}

struct CargoCard: CardDelegate, Identifiable, Equatable, Hashable {
    var id: Int
    var name: String
    let cargoType: CargoType
    let weight: Int
    
    public func hash(into hasher: inout Hasher) {
        return hasher.combine(id)
    }
    
    public static func == (left: CargoCard, right: CargoCard) -> Bool {
        return (left.id == right.id)
    }
}

extension CargoCard {
    /// Create all the cards in the game
    /// 43 cards:
    /// - 32 good cards (gold, silver, cocoa, corn).  Values: 1-3
    /// - 7 boxes of stone - 0 value; can be loaded on either side of the ship
    /// - 4 empty boxes - 0 Value; can be loaded on either side of the ship. Removes the last card played to that side.
    public static func makeCards() {
        
    }
}
