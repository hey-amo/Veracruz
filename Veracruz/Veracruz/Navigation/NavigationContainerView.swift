import Foundation
import SwiftUI

/// NavigationContainerView serves as the root navigation container for the app.
/// It manages both stack-based navigation and modal presentations by:
/// 1. Creating and maintaining the navigation handler as a source of truth
/// 2. Setting up the navigation stack for push/pop navigation
/// 3. Handling modal presentations through sheets
/// 4. Using ViewFactory to create views based on routes

struct NavigationContainerView: View {
    @StateObject private var navigationHandler = NavigationHandler()
    private let viewFactory = ViewFactory()
    
    var body: some View {
        NavigationStack(path: $navigationHandler.navigationPath) {
            
            // Set the root view (MainMenu) using the ViewFactory
            viewFactory.view(for: .mainMenu, navigationHandler: navigationHandler)
                // Configure navigation destinations for pushed views
                .navigationDestination(for: Route.self) { route in
                    viewFactory.view(for: route, navigationHandler: navigationHandler)
                }
        }
        .sheet(item: $navigationHandler.presentedModal) { route in
            viewFactory.view(for: route, navigationHandler: navigationHandler)
        }
    }
}
