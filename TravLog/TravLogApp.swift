//
//  TravLogApp.swift
//  TravLog
//
//  Created by asmaa gamal  on 31/10/2023.
//

import SwiftUI

@main
struct TravLogApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            NavigationView {
                SplahSwiftUIView()
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
            }
        }
    }
}
