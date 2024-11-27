//
//  RecipeApp.swift
//  Recipe
//
//  Created by IS 543 on 11/15/24.
//

import SwiftUI
import SwiftData

@main
struct RecipeApp: App {
    let container: ModelContainer
    let viewModel: RecipeViewModel

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(container)
        .environment(viewModel)
    }
    
    init() {
        do {
            container = try ModelContainer(for: Recipe.self)
        } catch {
            fatalError("Could not initialize model container: \(error)")
        }
        
        viewModel = RecipeViewModel(modelContext: container.mainContext)
    }
}
