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

extension CargoType: CustomStringConvertible {
    public var description: String {
        switch self {
        case .gold: return "Gold"
        case .silver: return "Silver"
        case .stone: return "Stone"
        case .cocoa: return "Cocoa"
        case .corn: return "Corn"
        case .empty: return "Empty"
        }
    }
}

public protocol CardDelegate {
    var id: Int { get }
    var name: String { get }
}

struct CargoCard: CardDelegate, Identifiable, Equatable, Hashable {
    var id: Int
    var name: String
    let cargoType: CargoType
    let weight: Int
    
    init(id: Int, name: String, cargoType: CargoType, weight: Int) {
        self.id = id
        self.name = name
        self.cargoType = cargoType
        self.weight = weight
    }
    
    public func hash(into hasher: inout Hasher) {
        return hasher.combine(id)
    }
    
    public static func == (left: CargoCard, right: CargoCard) -> Bool {
        return (left.id == right.id)
    }
}

extension CargoCard {
    struct CardDistribution {
        let type: CargoType
        let quantities: [(weight: Int, count: Int)] // array of tuples

    }

    /**
    43 good cards:
    - 7 Stones: 3x1, 2x2, 2x3
    - 8 Corn: 3x1, 3x2, 2x3,
    - 8 Cocoa: 3x1, 3x2, 2x3,
    - 8 Gold: 3x1, 3x2, 2x3,
    - 8 Silver: 3x1, 3x2, 2x3,
    - 4 Empty: 4x0
     */
    
    static let cardDistributions: [CardDistribution] = [
        CardDistribution(type: .stone, quantities: [(1,3), (2,2), (3,2)]),
        CardDistribution(type: .corn, quantities: [(1,3), (2,3), (3,2)]),
        CardDistribution(type: .cocoa, quantities: [(1,3), (2,3), (3,2)]),
        CardDistribution(type: .gold, quantities: [(1,3), (2,3), (3,2)]),
        CardDistribution(type: .silver, quantities: [(1,3), (2,3), (3,2)]),
        CardDistribution(type: .empty, quantities: [(0,4)])
    ]

    public static func makeCards() -> [CargoCard] {
        var cards: [CargoCard] = []
        var currentId = 1
        
        for distribution in cardDistributions {
            for quantity in distribution.quantities {
                for _ in 0..<quantity.count {
                    cards.append(CargoCard(
                        id: currentId,
                        name: distribution.type.rawValue.description,
                        cargoType: distribution.type,
                        weight: quantity.weight
                    ))
                    currentId += 1
                }
            }
        }
        
        print ("Made: \(cards.count) cards")
        
        return cards
    }
}
