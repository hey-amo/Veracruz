//
//  SettingsView.swift
//  Veracruz
//
//  Created by Amarjit on 02/11/2025.
//

import SwiftUI

struct SettingsView: View {
    let navigationHandler: NavigationHandler
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Sound") {
                    Toggle("Sound effects", isOn: .constant(true))
                    Toggle("Background music", isOn: .constant(true))
                }
                Section("Display") {
                    Toggle("Dark mode", isOn: .constant(true))
                }
                Section("Game") {
                    Button("Reset game data") {
                        // Do something
                    }
                    Button("Quit game") {
                        // Do something
                    }
                }
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") {
                        dismiss()
                    }
                }
            }
        }
    }
}


#Preview {
    SettingsView(navigationHandler: NavigationHandler())
}
