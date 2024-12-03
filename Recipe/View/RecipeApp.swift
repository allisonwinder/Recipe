//
//  RecipeApp.swift
//  Recipe
//
//  Created by IS 543 on 11/15/24.
//
// icon is from https://www.flaticon.com/free-icon/cooking_1065711?term=recipe&page=1&position=10&origin=search&related_id=1065711 and adjusted to the correct size in a sizer

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
            container = try ModelContainer(for: Recipe.self, Category.self)
        } catch {
            fatalError("Could not initialize model container: \(error)")
        }
        
        viewModel = RecipeViewModel(modelContext: container.mainContext)
    }
}
