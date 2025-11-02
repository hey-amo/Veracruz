//
//  SingleShipView.swift
//  Veracruz
//
//  Created by Amarjit on 30/10/2025.
//

import SwiftUI

/*
 struct Ship: Identifiable, Hashable, Equatable {
     let id: Int
     let name: String
     let shipColor: ShipColor
     let currentWeight: Int
     let capacity: Int
     let balance: Int // 1-5
     let cargoCards: [CargoCard]
     let playerBets: [InvestmentCard] // the order of cards is integral to the game
     let sailCriteria: Int // The ship may sail when its at this `sailCriteria` weight
     let status: ShipStatus = .atDock // Ships are defaulted to be `atDock`. Their status is only checked end of game
 */

/// Display a single ship
struct SingleShipView: View {
    var body: some View {
        Image("ship-01")
        Text("Ship.name") // Ship name
        Text("Ship.currentWeight:") // How much is on the ship (Int)
        Text("Ship.capacity") // The ships capactiy (Int)
        Text("")
    }
}

#Preview {
    SingleShipView()
}
