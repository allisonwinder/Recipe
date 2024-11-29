//
//  RecipeViewModel.swift
//  Recipe
//
//  Created by IS 543 on 11/25/24.
//
import Foundation
import SwiftData
import SwiftUI


@Observable
class RecipeViewModel {
    //MARK: - Properties
    
    private var modelContext: ModelContext
    
    //MARK: - Inititalization
    
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
        fetchData()
    }
    
    //MARK: - Model Access
    private(set) var recipes: [Recipe] = []
    
    private func fetchData() {
        
        try? modelContext.save()
        do {
            let descriptor = FetchDescriptor<Recipe>(sortBy: [SortDescriptor(\.name)])
            recipes = try modelContext.fetch(descriptor)
            print("Recipes fetched: \(recipes)")
            
            for recipe in recipes {
                print("Recipe: \(recipe.name), Categories: \(recipe.categories.map { $0.name })")
            }
            
        } catch {
            print("Failed to load recipes: \(error)")
        }
    }
    
    private(set) var favorites: [Recipe] = []
    
    private func fetchFavorites() {
        do {
            let descriptor = FetchDescriptor<Recipe>(predicate: #Predicate { $0.favorite },
                                                     sortBy: [SortDescriptor(\.name)])
            
            favorites = try modelContext.fetch(descriptor)
        } catch {
            print ("Failed to load favorites")
        }
    }


    
    //MARK: - User Intents
    
    
}
