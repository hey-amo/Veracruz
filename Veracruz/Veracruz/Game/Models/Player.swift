//
//  Player.swift
//  Veracruz
//
//  Created by Amarjit on 30/10/2025.
//

import Foundation

class Player: Identifiable, Equatable, Hashable {
    let id: Int
    var cards: [Card]
    var isOnTurn: Bool
    var isAI: Bool
    
    init(id: Int, cards: [Card], isOnTurn: Bool = false, isAI: Bool = false) {
        self.id = id
        self.cards = cards
        self.isAI = isAI
        self.isOnTurn = isOnTurn
    }
    
    public func hash(into hasher: inout Hasher) {
        return hasher.combine(id)
    }
    
    public static func == (left: Player, right: Player) -> Bool {
        return (left.id == right.id)
    }
}
