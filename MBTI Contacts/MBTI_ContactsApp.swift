//
//  MBTI_ContactsApp.swift
//  MBTI Contacts
//
//  Created by Ichsan Firdaus on 16/04/26.
//

import SwiftUI
import SwiftData

@main
struct MBTI_ContactsApp: App {
    let sharedModelContainer: ModelContainer
    
    init() {
        let schema = Schema([
            Contact.self,
            User.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            sharedModelContainer = try ModelContainer(for: schema, configurations: [modelConfiguration])
            
            let context = sharedModelContainer.mainContext
            Task { @MainActor in
                MBTIData.seedData(context: context)
            }
            
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
