//
//  VeracruzApp.swift
//  Veracruz
//
//  Created by Amarjit on 30/10/2025.
//

import SwiftUI

@main
struct VeracruzApp: App {
    //let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainMenuView()
                //.environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
