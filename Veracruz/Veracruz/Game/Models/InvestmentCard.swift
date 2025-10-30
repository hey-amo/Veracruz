//
//  InvestmentCard.swift
//  Veracruz
//
//  Created by Amarjit on 30/10/2025.
//

/// There are 4 investment cards; one dealt to each player, rest are discarded/unused, this is their secret hidden agenda card
public struct InvestmentCard: CardDelegate, Equatable, Hashable, Identifiable {
    public var id: Int
    public var name: String
    public let cargoType: CargoType
}
