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
        
        HStack {
            VStack {
                Image("ship-01")
                    .resizable()
                    .frame(width:100, height: 100)
                    .aspectRatio(contentMode: .fit)
                Text("Ship.name")
                    .font(.headline)
            }
            HStack { // Balance
                HStack {
                    Text("⚖️").font(.largeTitle)
                    Text("-3").font(.largeTitle)
                }
                HStack { // Cargo current/max
                    Text("📦").font(.largeTitle)
                    Text("15/15").font(.largeTitle)
                }
            }
        }
        Text("⚠️ This ship is likely to sink")
        VStack {
            HStack {
                Text("🂠🂠🂠 3").font(.largeTitle)
                Text("🂠🂠 2").font(.largeTitle)
            }
            Text("Bets")
                .font(.headline)
            HStack {
                Image("avt-1")
                    .resizable()
                    .frame(width:50, height: 50)
                Text("1st").font(.footnote)
                    
                Image("avt-2")
                    .resizable()
                    .frame(width:50, height: 50)
                Text("2nd").font(.footnote)
                
                Image("avt-3")
                    .resizable()
                    .frame(width:50, height: 50)
                Text("3rd").font(.footnote)
                                
                Image("avt-4")
                    .resizable()
                    .frame(width:50, height: 50)
                Text("4th").font(.footnote)
            
                    
            }
        }
    }
}

#Preview {
    SingleShipView()
}
