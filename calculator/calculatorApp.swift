//
//  calculatorApp.swift
//  calculator
//
//  Created by Josh Holubiak on 5/9/24.
//

import SwiftUI

@main
struct calculatorApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
