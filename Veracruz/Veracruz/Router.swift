//
//  Router.swift
//  Veracruz
//
//  Created by Amarjit on 30/10/2025.
//

/// Router for navigation
enum Route: Identifiable, CaseIterable {
    case mainMenu // launches mainMenuView
    case newGameSetup // launches PlayerSelectScreenView
    case game // launches GameView
    case winner // launches WinnerView
    case settings // launches SettingsView

    // Conform to Identifiable protocol
    var id: Self { self }
}
