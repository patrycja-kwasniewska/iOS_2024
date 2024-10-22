//
//  MemoryGameApp.swift
//  MemoryGame
//
//  Created by Patrycja Kwaśniewska on 22/10/2024.
//

import SwiftUI

@main
struct MemoryGameApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
