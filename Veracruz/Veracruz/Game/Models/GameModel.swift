//
//  GameModel.swift
//  Veracruz
//
//  Created by Amarjit on 30/10/2025.
//

import Foundation

public enum GameState: Int, CaseIterable {
    case idle, thinking, playing, gameOver
}

class GameModel {
    var players: [Player]
    var drawDeck: [Card] // Draw deck of good cards
    var marketplace: [Card] // A collection of cards available to take
    var discardDeck: [Card] // The discard deck
    var ships: [Ship] // Only 3 ships in the game
    var weather: Int // Int: 1-5
    private let allShipsReadyToSailFlag = 3 // When all 3 ships are ready to sail
    
    init(players: [Player], drawDeck:[Card], marketplace:[Card], discardDeck:[Card], ships:[Ship], weather: Int = 3) {
        self.players = players
        self.drawDeck = drawDeck
        self.discardDeck = discardDeck
        self.marketplace = marketplace
        self.ships = ships
        self.weather = weather
    }
    
    func isGameOver() -> Bool {
        /// The game is immediatley over when:
        /// - All ships have reached their safe loading limit
        ///
        let readyToSailAllShips = ships.map {
            return $0.isReadyToSail == true
        }.count
        
        if (readyToSailAllShips == allShipsReadyToSailFlag) {
            print ("All ships are ready to sail.")
        }
        
        return false
    }
}

extension GameModel {
    public static func prepareGame(for players: [Player]) -> GameModel? {
        return nil
    }
}
