# Veracruz

An implementation of a card game about shipping goods

--

## About

Card game
2-4 players 
4 investment cards (Gold, Silver, Cocoa, Corn)
1x `Sink` and 1x `Sail` per player

5 goods:
	Gold, Silver, Stone, Cocoa, Corn
43 good cards, (quantities and values)
    - 7 Stones: 3x1, 2x2, 2x3
    - 8 Corn: 3x1, 3x2, 2x3,
    - 8 Cocoa: 3x1, 3x2, 2x3,
    - 8 Gold: 3x1, 3x2, 2x3,
    - 8 Silver: 3x1, 3x2, 2x3,
    - 4 Empty: 4x0

1 weather indicator (Range: 1-5)
1 weather token (Coin with heads or tails)

3 ships:

- Santa Teresa. Capacity: 11 goods. Sail criteria: 9
- San Antonio. Capacity: 13 goods, Sail criteria: 11
- El Juncal. Capacity: 15 goods, Sail criteria: 13

--

## Setup

Set weather integer to 3
Set all ships initial balance to 0
Set all ships initial goods to 0 (all start empty)
Shuffle 43 good cards and give each player 4 good cards
Create a market of 2 decks, 4 cards per deck from the goods card
Place remaining good cards face down in a `draw pile`
Randomly select First player
Give each player 1 randomised, secret investment card. Un-used investment cards are returned to the box
Give each player 2 betting cards: 1x Sink, 1x Sail.
Update the weather (See `Weather`).

--

## Weather

The weather is a track from 1-5 and is updated periodically throughout the game.

The weather token is a coin with `heads` or `tails`.

Updating the the weather means to:
- Toss the weather token to get `heads` or `tails`
- If heads, decrease the weather integer 
- If tails, increment the weather integer
- The weather integer never exceeds its range 1-5.

The weather effects ships at the end of the game, and has no affect during gameplay.

--

## Sequence of play

Play is executed in clockwise turn order, with each player taking a single turn.

On their turn, a player must either:

- Option 1: Load ships (Play a goods card)

A player may play a single goods card from their hand to one ship.

Goods cards all have a value of `1-3`. Empty good cards have a value of `0`.

Good cards cannot be played to a ship if it will exceed `capacity` (ie: A ship has a capacity of 13, the current goods load is 11, a player cannot therefore play a 3, as this would exceed the capacity).

Ships have a `left hand side` and `right hand side`. These act as `decks` to hold `good cards`.  Good cards added to one of the two sides will be splayed so that it shows the integer.

`Gold` and `Silver` goods cards must always be placed on the left hand side of a ship, and are added to to the left hand side deck.

`Cocoa` and `Corn` good cards must always be placed on the right hand side of a ship, and are added to the right hand side deck.

Stone good cards can be placed on either side.

Empty good cards can be placed on either side.  Empty good cards are always `0` and this will remove the last card played from the game.

After a good card is played, the following are updated:

- `Ship capacity tracker` increase this integer by the value of the `goods card` played.
- `Ship balance tracker` (5,4,3,2,1), 0, (1,2,3,4,5).  If the card was played to the left hand side, the tracker moves to its left.  If the card was played to the right hand side, the tracker moves to its right.   The balance never exceeds its minimum or maximum.

- Option 2: Place a bet

If a player has no available betting cards, they may not perform this option.

Each player has 2 betting cards at the start of the game, 1 bets that a ship will `Sail`, and the other that a ship will `Sink`. 

With this option, the player may place 1 of their betting cards onto one of the ships.

The order in which these betting cards are placed are very important to scoring, where the first card placed gets the most rewards.  See `Scoring` for more details.

After completing their turn, play moves to the next player on turn.

--

## End of game

The game ends immediately when of all 3 ships have reached their `sailCriteria` (Int)

The weather is changed one last time
Check each ship to see if it `sunk` or `sailed`

## Sink or sail?

- The galleon `sinks` if its `imbalance` value is equal or higher than the final `Weather` value
- The galleon `sails` if if its `imbalance` value is lower than the final `Weather` value
Example: If the game ends with `Weather 3`, a galleon with `imbalance 3` sinks, whilst another galleon with `imbalance 2` sails

## Scoring:

All players reveal their secret initial investment and score according to:

* Their investment: Score the weight of the corresponding goods investment from those galleons reaching port. Sunken galleons don’t score.

* Their bets: Face up the three betting decks and resolve them in order. For every galleon, players who bet and guessed right score according to the order of the bet. The first scores 4 points, the second scores 2 points and the third scores 1 point. For every failed bet, a player loses 1 point.

## Declaring the winner:

The player with the highest score (points) wins the game.

In case of a tie, the player with the most points in their investment wins.

- If the tie persists, the tied players share the victory.
- If all the galleons sink, nobody wins the game.


