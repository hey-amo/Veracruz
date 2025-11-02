//
//  TopHUDView.swift
//  Veracruz
//
//  Created by Amarjit on 30/10/2025.
//

import SwiftUI

/// Show a list of players with a notification bell and settings button
struct TopHUDView: View {
    var body: some View {
        VStack {
            PlayerAvatarView()
            Text("Cards: 3")
            Button("Bell") {
                // Do something
            }
            Button("Gear") {
                // Do something
            }
        }
    }
}

#Preview {
    TopHUDView()
}
