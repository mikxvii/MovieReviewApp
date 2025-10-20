//
//  MovieReviewAppApp.swift
//  MovieReviewApp
//
//  Created by Michael Guerrero on 10/19/25.
//

import SwiftUI
import SwiftData
import FirebaseCore

// TODO: Add @main attribute to mark this as the app's entry point
// iOS looks for @main to know where to start the app
// Only one @main allowed per project
_______
struct MovieReviewAppApp: App {
    
    // SwiftData setup (can ignore - we're using Firebase instead)
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    
    // TODO: Create an initializer that configures Firebase
    // This runs ONCE when the app launches (before any views appear)
    // Firebase MUST be configured before using any Firebase features!
    _______() {
        
        // TODO: Call FirebaseApp.configure()
        // This reads GoogleService-Info.plist and connects to Firebase
        FirebaseApp._______()
    }

    // TODO: Implement the required "body" property
    // This describes the app's scene structure
    // "some Scene" is like "some View" but for app-level structure
    var body: some Scene {
        
        // TODO: Create a WindowGroup containing ContentView
        // WindowGroup is the container for the app's main window
        // ContentView() is the first view the user sees
        _______ {
            _______()
        }
        .modelContainer(sharedModelContainer)
    }
}
