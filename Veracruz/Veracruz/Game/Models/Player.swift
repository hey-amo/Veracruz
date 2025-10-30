//
//  Player.swift
//  Veracruz
//
//  Created by Amarjit on 30/10/2025.
//

import Foundation

class Player: Identifiable, Equatable, Hashable {
    let id: Int
    var cards: [CargoCard]
    var investmentCard: InvestmentCard?
    var bettingCards: [BettingCard]
    var isOnTurn: Bool
    var isAI: Bool
    var score: Int
    
    init(id: Int, cards: [CargoCard], investmentCard: InvestmentCard?, bettingCards: [BettingCard],
         isOnTurn: Bool = false, isAI: Bool = false, score: Int) {
        self.id = id
        self.cards = cards
        self.investmentCard = investmentCard
        self.bettingCards = bettingCards
        self.isAI = isAI
        self.isOnTurn = isOnTurn
        self.score = score
    }
    
    public func hash(into hasher: inout Hasher) {
        return hasher.combine(id)
    }
    
    public static func == (left: Player, right: Player) -> Bool {
        return (left.id == right.id)
    }
}
