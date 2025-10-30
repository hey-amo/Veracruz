//
//  Card.swift
//  Veracruz
//
//  Created by Amarjit on 30/10/2025.
//

import Foundation

public enum CargoType: Int, CaseIterable {
    case none, gold, silver, stone, cocoa, grain
}

public enum CardType {
    case cargo, biddingDidSink, biddingDidSail
    case hiddenAgenda(CargoType)
}

struct Card: Identifiable, Equatable, Hashable {
    let id: UUID
    let name: String
    let type: CardType
    let cargoType: CargoType
    let weight: Int
    
    public func hash(into hasher: inout Hasher) {
        return hasher.combine(id)
    }
    
    public static func == (left: Card, right: Card) -> Bool {
        return (left.id == right.id)
    }
}

extension Card {
    /// All the cards in the game
    public static func makeCards() {
        
    }
}
