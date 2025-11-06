//
//  MainMenuView.swift
//  Veracruz
//
//  Created by Amarjit on 02/11/2025.
//

import SwiftUI

struct MainMenuView: View {
    let navigationHandler: NavigationHandler

    var body: some View {
        VStack {
            Text("Veracruz")
                .font(.largeTitle)
            Button("Play") {
                print("Pressed play")
                // Go to player select screen
                navigationHandler.navigate(to: .newGameSetup)
            }
            Button("Continue") {
                // Do something
            }.disabled(true)
        }
    }
}

#Preview {
    MainMenuView(navigationHandler: NavigationHandler())
}
