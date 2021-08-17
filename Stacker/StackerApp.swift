//
//  StackerApp.swift
//  Stacker
//
//  Created by Matthew on 8/14/21.
//

import SwiftUI

@main
struct StackerApp: App {
    
    let persistenceController = PersistenceController.shared // CoreData

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
