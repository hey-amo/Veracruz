//
//  VeracruzTests.swift
//  VeracruzTests
//
//  Created by Amarjit on 30/10/2025.
//

import Testing
@testable import Veracruz

struct VeracruzTests {
    
    @Test("Checking card count")
    func cardCountCards_Tests() async throws {
        let cards = CargoCard.makeCards()
        
        // Test total number of cards
        #expect(cards.count == 43, "Total number of cards should be 43")
    }
    
    @Test("Checking distribution")
    func cardDistribution_Tests() async throws {
        let cards = CargoCard.makeCards()
        
        // Test distribution per cargo type and weight
        for distribution in CargoCard.cardDistributions {
            let cardsOfType = cards.filter { $0.cargoType == distribution.type }
            
            // Test total cards for this type
            let expectedTotal = distribution.quantities.reduce(0) { $0 + $1.count }
            #expect(cardsOfType.count == expectedTotal,
                    "Expected \(expectedTotal) cards of type \(distribution.type)")
            
            // Test weight distribution
            for quantity in distribution.quantities {
                let cardsWithWeight = cardsOfType.filter { $0.weight == quantity.weight }
                #expect(cardsWithWeight.count == quantity.count,
                        "Expected \(quantity.count) \(distribution.type) cards with weight \(quantity.weight)")
            }
        }
    }
    
    
}
