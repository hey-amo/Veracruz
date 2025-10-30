//
//  EndOfGame.swift
//  Veracruz
//
//  Created by Amarjit on 30/10/2025.
//
/// # End of game
/// The end of the game is reached when of all 3 ships have reached their `sailCriteria` (Int)
/// The end of the game is immediate
/// The weather is changed one last time
/// Check each ship to see if it `sunk` or `sailed`
/// - The galleon `sinks` if its `imbalance` value is equal or higher than the final `Weather` value
/// - The galleon `sails` if if its `imbalance` value is lower than the final `Weather` value
/// Example: If the game ends with `Weather 3`, a galleon with `imbalance 3` sinks, whilst another galleon with `imbalance 2` sails
///
/// # Scoring:
/// All players reveal their initial investment and score according to:
/// * Their investment: Score the weight of the corresponding goods investment from those galleons reaching port. Sunken galleons don’t score.
/// * Their bets: Face up the three betting decks and resolve them in order. For every galleon, players who bet and guessed right score according to the order of the bet. The first scores 4 points, the second scores 2 points and the third scores 1 point. For every failed bet, a player loses 1 point.
///
/// # Declaring the winner:
/// The player with the highest score (points) wins the game.
/// In case of a tie, the player with the most points in their investment wins.
/// If the tie persists, the tied players share the victory.
/// If all the galleons sink, nobody wins the game.

class EndOfGameHandler {
    private var gameModel: GameModel
    
    init(gameModel: GameModel) {
        self.gameModel = gameModel
    }
    
    func execute() {
        print ("End of game reached")
        print ("1. Final weather check")
        print ("2. Check each ship - Sunk or Sailed?")
        print ("3. Perform scoring -- Unless all ships sunk")
        print ("4. Declare the winner")
        print ("5. End of game - Play again?")
    }

}
