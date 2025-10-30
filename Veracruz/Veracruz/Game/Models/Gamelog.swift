//
//  Gamelog.swift
//  Veracruz
//
//  Created by Amarjit on 30/10/2025.
//

import Foundation

struct GameMessage: Identifiable, Hashable {
    let id: UUID
    let entry: String
    let date: Date
}

