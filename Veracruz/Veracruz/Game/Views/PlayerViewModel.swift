//
//  PlayerViewModel.swift
//  Veracruz
//
//  Created by Amarjit on 30/10/2025.
//

struct PlayerViewModel: Identifiable, Equatable, Hashable {
    let id: Int
    let avatar: String
    let cards: [CargoCard]
    let investmentCard: InvestmentCard?
    let bettingCards: [BettingCard]
    let isOnTurn: Bool
    let isAI: Bool
    let score: Int
}

extension PlayerViewModel {
    func updateScore(_ score: Int = 0) {
        guard score > 0 else {
            return
        }
    }
}
