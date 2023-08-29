//
//  OracleTestApp.swift
//  OracleTest
//
//  Created by Jael  on 29/08/23.
//

import SwiftUI

@main
struct OracleTestApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
