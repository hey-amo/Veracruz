//
//  WeatherManager.swift
//  Veracruz
//
//  Created by Amarjit on 30/10/2025.
//

import Foundation

/// In the game, a coin is tossed and the weather track is updated. Weather has a range of {1..5}
struct WeatherManager {
    public static func updateWeather(from currentWeather: Int) -> Int {
        let minWeather = 1
        let maxWeather = 5
        
        // Toss a coin
        let coinToss = Bool.random()
        var newWeather = currentWeather
        
        if (coinToss == true) {
            // If `heads`: increase weather by 1
            guard newWeather < 5 else {
                print ("Weather is maxed out. Value: \(currentWeather)")
                return currentWeather
            }
            newWeather += 1
        }
        else {
            // If `tails`: decrease weather by 1
            guard newWeather > 1 else {
                print ("Weather is at minimum. Value: \(currentWeather)")
                return currentWeather
            }
            newWeather -= 1
        }
        
        
        // Log a message
        print ("Weather was \(currentWeather), and is now \(newWeather)")
        
        return newWeather
    }
}
