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

public enum ShipStatus: Int {
    case sunk, sailed, atDock
}

extension ShipError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .tooMuchWeight(let capacity):
            return "Cannot load: This ship has a max capacity of \(capacity) cargo"
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

public enum ShipSide: Int, CaseIterable {
    case left, right
}

struct Ship: Identifiable, Hashable, Equatable {
    let id: Int
    let name: String
    let shipColor: ShipColor
    let currentWeight: Int
    let capacity: Int
    let balance: Int // 1-5
    let cargoCards: [CargoCard]
    let playerBets: [InvestmentCard] // the order of cards is integral to the game
    let loadingLimit: Int // The ship may sail when its at this weight limit
    let status: ShipStatus = .atDock // Ships are defaulted to be `atDock`. Their status is only checked end of game
    
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

extension Ship {
    private func updateBalance(side: ShipSide, cargo: CargoCard) -> Int {
        return 0
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
                         cargoCards: [CargoCard](),
                         playerBets: [InvestmentCard](),
                           loadingLimit: 9)
        let ship2 = Ship(id: 1,
                           name: "San Antonio",
                         shipColor: .red,
                           currentWeight: 0,
                           capacity: 13,
                           balance: 0,
                           cargoCards: [CargoCard](),
                         playerBets: [InvestmentCard](),
                           loadingLimit: 11)
        let ship3 = Ship(id: 3,
                           name: "El Juncal",
                         shipColor: .purple,
                           currentWeight: 0,
                           capacity: 13,
                           balance: 0,
                         cargoCards: [CargoCard](),
                         playerBets: [InvestmentCard](),
                           loadingLimit: 15)
        
        let ships = [ship1, ship2, ship3]
        
        return ships
    }
}


/// #TBD
extension Ship {
    func add(card: CargoCard) throws {
        let totalWeight = (capacity + card.weight)
        if totalWeight > capacity {
            throw ShipError.tooMuchWeight(capacity: capacity)
        }
    }
    func remove(card: CargoCard) throws -> CargoCard? {
        guard (self.cargoCards.count > 0) else {
            throw ShipError.shipHasZeroCards
        }
        // find the card, remove it from the ship and return it so it can be added to a discardPile
        return card
    }
    private func pop(card: CargoCard, atIndex: Int) {
    }
}
