import Foundation
import SwiftUI

protocol ViewFactoryProtocol {
    func view(for route: Route, navigationHandler: NavigationHandler) -> AnyView
}

// Factory pattern to create views
// Tries to create views without exposing creation logic
// Protocol: ViewFactoryProtocol
// Factory method: view(for:navigationHandler:)
// Product: The view created by the factory

struct ViewFactory: ViewFactoryProtocol {
    func view(for route: Route, navigationHandler: NavigationHandler) -> AnyView {
        switch route {
        case .mainMenu:
            return AnyView(MainMenuView(navigationHandler: navigationHandler))
        case .newGameSetup:
            return AnyView(PlayerSelectScreenView(navigationHandler: navigationHandler))
        case .game:
            return AnyView(GameView(navigationHandler: navigationHandler))
        case .winner:
            return AnyView(WinnerView(navigationHandler: navigationHandler))
        case .settings:
            return AnyView(SettingsView(navigationHandler: navigationHandler))
        }
    }
}