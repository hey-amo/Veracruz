//
//  BettingCard.swift
//  Veracruz
//
//  Created by Amarjit on 30/10/2025.
//

/// Each player is given 2 betting cards, one that bets a `ship will sink` and another that a `ship will sail`
/// When ships sail, assigned betting cards are assessed
public struct BettingCard: CardDelegate, Identifiable, Hashable, Equatable {
    public var id: Int
    public var name: String
    let betWillSail: Bool
    let value: String
    
    public static func == (left: BettingCard, right: BettingCard) -> Bool {
        return left.id == right.id
    }
    
    public func hash(into hasher: inout Hasher) {
        return hasher.combine(id)
    }
}
