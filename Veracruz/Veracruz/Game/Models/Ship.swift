//
//  Ship.swift
//  Veracruz
//
//  Created by Amarjit on 30/10/2025.
//

import Foundation
import UIKit

public enum ShipError: Error {
    case tooMuchWeight(capacity: Int)
    case shipHasZeroCards
}

extension ShipError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .tooMuchWeight(let capacity):
            return "Cannot load - This ship has a max capacity of \(capacity)"
        case .shipHasZeroCards:
            return "This ship has no cards"
        }
    }
}

public enum ShipColor: Int {
    case green, red, purple
    
    func getShipColor() -> UIColor {
        switch self {
        case .green: return .systemGreen
        case .red: return .systemRed
        case .purple: return .systemPurple
        }
    }
}

struct Ship: Identifiable, Hashable, Equatable {
    let id: Int
    let name: String
    let shipColor: ShipColor
    let currentWeight: Int
    let capacity: Int
    let balance: Int
    let cards: [Card]
    let playerBets: [Card]
    let loadingLimit: Int // The ship may sail when its at this weight limit
    
    public var weight: Int {
        get {
            return self.currentWeight
        }
    }
    
    /// The ship is ready to sail when the currentWeight hits the loadingLimit
    public var isReadyToSail: Bool {
        return (currentWeight >= loadingLimit)
    }
}

/// There are only 3 ships in the game
extension Ship {
    public static func makeShips() -> [Ship] {
        let ship1 = Ship(id: 1,
                           name: "Santa Teresa",
                         shipColor: .green,
                           currentWeight: 0,
                           capacity: 11,
                           balance: 0,
                           cards: [Card](),
                         playerBets: [Card](),
                           loadingLimit: 9)
        let ship2 = Ship(id: 1,
                           name: "San Antonio",
                         shipColor: .red,
                           currentWeight: 0,
                           capacity: 13,
                           balance: 0,
                           cards: [Card](),
                         playerBets: [Card](),
                           loadingLimit: 11)
        let ship3 = Ship(id: 3,
                           name: "El Juncal",
                         shipColor: .purple,
                           currentWeight: 0,
                           capacity: 13,
                           balance: 0,
                           cards: [Card](),
                         playerBets: [Card](),
                           loadingLimit: 15)
        
        let ships = [ship1, ship2, ship3]
        
        return ships
    }
}

extension Ship {
    func add(card: Card) throws {
        let totalWeight = (capacity + card.weight)
        if totalWeight > capacity {
            throw ShipError.tooMuchWeight(capacity: capacity)
        }
    }
    func remove(card: Card) throws -> Card? {
        guard (self.cards.count > 0) else {
            throw ShipError.shipHasZeroCards
        }
        // find the card, remove it from the ship and return it so it can be added to a discardPile
        return card
    }
    private func pop(card: Card, atIndex: Int) {
        guard (self.cards.count > 0) else {
            return
        }
    }
}
