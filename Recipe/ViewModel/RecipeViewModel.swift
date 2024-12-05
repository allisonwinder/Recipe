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
        Data(context: modelContext)
        fetchData()
        fetchFavorites()
    }
    
    //MARK: - Model Access
    private(set) var allRecipes: [Recipe] = []
    private(set) var allCategories: [Category] = []
    
    
    private func fetchData() {
        do {
            
            try modelContext.save()
            // Fetch all recipes
            let recipeDescriptor = FetchDescriptor<Recipe>(sortBy: [SortDescriptor(\.name)])
            allRecipes = try modelContext.fetch(recipeDescriptor)
            
            // Fetch all categories
            let categoryDescriptor = FetchDescriptor<Category>(sortBy: [SortDescriptor(\.name)])
            allCategories = try modelContext.fetch(categoryDescriptor)
            
            print("Recipes fetched: \(allRecipes.count)")
            print("Categories fetched: \(allCategories.count)")
            
        } catch {
            print("Error fetching data: \(error)")
        }
    }
    
    private(set) var favorites: [Recipe] = []
    
    private func fetchFavorites() {
        do {
            let descriptor = FetchDescriptor<Recipe>(predicate: #Predicate { $0.favorite },
                                                     sortBy: [SortDescriptor(\.name)])
            
            favorites = try modelContext.fetch(descriptor)
            print("Favorites fetched: \(favorites.count)")
        } catch {
            print ("Failed to load favorites")
        }
    }
    
    
    
    
    //MARK: - User Intents
    
    func saveRecipe(_ recipe: Recipe) {
        do {
            try modelContext.save()
            print("saved")
        } catch {
            print("Error saving recipe: \(error)")
        }
    }
        
        
        func addCategory(name: String) {
            guard !name.isEmpty, !allCategories.contains(where: { $0.name == name }) else { return }
            let newCategory = Category(name: name)
            modelContext.insert(newCategory)
            saveContext()
            fetchData()
        }
        
        func updateCategory(category: Category, newName: String) {
            guard !newName.isEmpty else { return }
            category.name = newName
            saveContext()
            fetchData()
        }
        
        func deleteCategory(category: Category) {
            modelContext.delete(category)
            saveContext()
            fetchData()
        }
        
        func saveContext() {
            do {
                try modelContext.save()
            } catch {
                print("Error saving context: \(error)")
            }
        }
    
    @MainActor
    func toggleFavorite(recipe: Recipe) {
        recipe.favorite.toggle()
        do {
            print(modelContext.hasChanges)
            try modelContext.save()
            print(modelContext.hasChanges)
            saveContext()
            saveRecipe(recipe)
        } catch {
            print("Error saving context: \(error)")
        }
        fetchData()
        fetchFavorites()
    }


        
}
    
