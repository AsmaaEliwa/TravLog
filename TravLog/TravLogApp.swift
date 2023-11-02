//
//  TravLogApp.swift
//  TravLog
//
//  Created by asmaa gamal  on 31/10/2023.
//

import SwiftUI

@main
struct TravLogApp: App {
    @AppStorage("isLogIn") var isLogIn:Bool?
    let persistenceController = DataManger.shared.persistentContainer
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                Group {
                    if isLogIn ?? false{
                                 // Display the UserProfileView when isLogIn is true
                                 UserProfileView()
                             } else {
                                 // Display the SplashSwiftUIView when isLogIn is false
                                 SplahSwiftUIView()
                             }
                         }
                    .environment(\.managedObjectContext, persistenceController.viewContext)
            }
        }
    }
}
