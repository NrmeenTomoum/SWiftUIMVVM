//
//  ProductProjectApp.swift
//  ProductProject
//
//  Created by Nermeen Tomoum on 27/04/2022.
//

import SwiftUI

@main
struct ProductProjectApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
