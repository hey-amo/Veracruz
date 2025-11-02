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
    /// # Create all the good cards in the game
    ///
    /// 43 good cards:
    /// - 7 Stones: 3x1, 2x2, 2x3
    /// - 8 Corn: 2x3, 3x2, 3x1
    /// - 8 Gold: 2x3, 3x3, 3x1
    /// - 8 Cocoa: 2x3, 3x2, 3x1
    /// - 8 Silver: 2x3, 3x2, 3x1
    /// - 4 Empty: 4x0
    public static func makeCards() -> [CargoCard] {
        let cargoCards: [CargoCard] = [
            CargoCard(id: 1, name: "Stone", cargoType: .stone, weight: 1),
            CargoCard(id: 2, name: "Stone", cargoType: .stone, weight: 1),
            CargoCard(id: 3, name: "Stone", cargoType: .stone, weight: 1),
            CargoCard(id: 4, name: "Stone", cargoType: .stone, weight: 2),
            CargoCard(id: 5, name: "Stone", cargoType: .stone, weight: 2),
            CargoCard(id: 6, name: "Stone", cargoType: .stone, weight: 3),
            CargoCard(id: 7, name: "Stone", cargoType: .stone, weight: 3),
            CargoCard(id: 8, name: "Corn", cargoType: .corn, weight: 1),
            CargoCard(id: 9, name: "Corn", cargoType: .corn, weight: 1),
            CargoCard(id: 10, name: "Corn", cargoType: .corn, weight: 1),
            CargoCard(id: 11, name: "Corn", cargoType: .corn, weight: 2),
            CargoCard(id: 12, name: "Corn", cargoType: .corn, weight: 2),
            CargoCard(id: 13, name: "Corn", cargoType: .corn, weight: 2),
            CargoCard(id: 14, name: "Corn", cargoType: .corn, weight: 3),
            CargoCard(id: 15, name: "Corn", cargoType: .corn, weight: 3),
            CargoCard(id: 16, name: "Corn", cargoType: .corn, weight: 3),
            CargoCard(id: 17, name: "Gold", cargoType: .gold, weight: 1),
            CargoCard(id: 18, name: "Gold", cargoType: .gold, weight: 1),
            CargoCard(id: 19, name: "Gold", cargoType: .gold, weight: 1),
            CargoCard(id: 20, name: "Gold", cargoType: .gold, weight: 2),
            CargoCard(id: 21, name: "Gold", cargoType: .gold, weight: 2),
            CargoCard(id: 22, name: "Gold", cargoType: .gold, weight: 3),
            CargoCard(id: 23, name: "Gold", cargoType: .gold, weight: 3),
            CargoCard(id: 24, name: "Silver", cargoType: .silver, weight: 1),
            CargoCard(id: 25, name: "Silver", cargoType: .silver, weight: 1),
            CargoCard(id: 26, name: "Silver", cargoType: .silver, weight: 1),
            CargoCard(id: 27, name: "Silver", cargoType: .silver, weight: 2),
            CargoCard(id: 28, name: "Silver", cargoType: .silver, weight: 2),
            CargoCard(id: 29, name: "Silver", cargoType: .silver, weight: 2),
            CargoCard(id: 30, name: "Silver", cargoType: .silver, weight: 3),
            CargoCard(id: 31, name: "Silver", cargoType: .silver, weight: 3),
            CargoCard(id: 32, name: "Cocoa", cargoType: .cocoa, weight: 1),
            CargoCard(id: 33, name: "Cocoa", cargoType: .cocoa, weight: 1),
            CargoCard(id: 34, name: "Cocoa", cargoType: .cocoa, weight: 1),
            CargoCard(id: 35, name: "Cocoa", cargoType: .cocoa, weight: 2),
            CargoCard(id: 36, name: "Cocoa", cargoType: .cocoa, weight: 2),
            CargoCard(id: 37, name: "Cocoa", cargoType: .cocoa, weight: 2),
            CargoCard(id: 38, name: "Cocoa", cargoType: .cocoa, weight: 3),
            CargoCard(id: 39, name: "Cocoa", cargoType: .cocoa, weight: 3),
            CargoCard(id: 40, name: "Empty", cargoType: .empty, weight: 0),
            CargoCard(id: 41, name: "Empty", cargoType: .empty, weight: 0),
            CargoCard(id: 42, name: "Empty", cargoType: .empty, weight: 0),
            CargoCard(id: 43, name: "Empty", cargoType: .empty, weight: 0),
        ]

        return cargoCards
    }
}
