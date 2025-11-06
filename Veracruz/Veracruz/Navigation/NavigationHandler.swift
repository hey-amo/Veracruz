import SwiftUI
import Foundation

// Protocol defining navigation actions
protocol NavigationHandling {
    func navigate(to route: Route)
    func popToRoot()
    func dismiss()
    func presentModal(route: Route)
    func dismissModal()
}

// Main navigation handler class
class NavigationHandler: NavigationHandling, ObservableObject {
    @Published var navigationPath = NavigationPath()
    @Published var presentedModal: Route?
    
    func navigate(to route: Route) {
        navigationPath.append(route)
    }
    
    func popToRoot() {
        navigationPath.removeLast(navigationPath.count)
    }
    
    func dismiss() {
        guard !navigationPath.isEmpty else { return }
        navigationPath.removeLast()
    }
    
    func presentModal(route: Route) {
        presentedModal = route
    }
    
    func dismissModal() {
        presentedModal = nil
    }
}