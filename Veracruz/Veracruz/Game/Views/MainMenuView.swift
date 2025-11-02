//
//  MainMenuView.swift
//  Veracruz
//
//  Created by Amarjit on 02/11/2025.
//

import SwiftUI

struct MainMenuView: View {
    var body: some View {
        VStack {
            Text("Veracruz")
                .font(.largeTitle)
            Button("Play") {
                // Do something
            }
            Button("Continue") {
                // Do something
            }.disabled(true)
        }
    }
}

#Preview {
    MainMenuView()
}
