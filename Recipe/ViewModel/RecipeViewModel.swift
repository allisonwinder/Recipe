//
//  RecipeViewModel.swift
//  Recipe
//
//  Created by IS 543 on 11/25/24.
//
// Chat GPT helped me debug some issues with my fetchData or saving the model context; however, most of this is what we learned in class or I got help debugging from Professor Liddle.

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
        fetchFavorites()
    }
    
    //MARK: - Model Access
    
    private(set) var allRecipes: [Recipe] = []
    private(set) var allCategories: [Category] = []
    
    
    private func fetchData() {
        do {
            
            try? modelContext.save()

            let recipeDescriptor = FetchDescriptor<Recipe>(sortBy: [SortDescriptor(\.name)])
            allRecipes = try modelContext.fetch(recipeDescriptor)

            let categoryDescriptor = FetchDescriptor<Category>(sortBy: [SortDescriptor(\.name)])
            allCategories = try modelContext.fetch(categoryDescriptor)
            
            if allRecipes.isEmpty {
                Data(context: modelContext)
                fetchData()
            }
            
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
        
    func addCategory(name: String) {
        guard !name.isEmpty, !allCategories.contains(where: { $0.name == name }) else { return }
        let newCategory = Category(name: name)
        modelContext.insert(newCategory)
        saveContext()
        fetchData()
    }

    
    func deleteCategory(category: Category) {
        modelContext.delete(category)
        saveContext()
        fetchData()
    }
        

    
    func deleteRecipe(_ recipe: Recipe) {
        for category in recipe.categories {
            category.recipes.removeAll { $0.id == recipe.id }
        }
        modelContext.delete(recipe)
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

    func saveRecipe(_ recipe: Recipe) {
        
        let allCategory = allCategories[0]
        
        if !recipe.categories.contains(allCategory) {
            recipe.categories.append(allCategory)
        }
        
        do {
            try modelContext.save()
            print("saved")
        } catch {
            print("Error saving recipe: \(error)")
        }
        fetchData()
        fetchFavorites()
    }
    
    func toggleFavorite(recipe: Recipe) {
        recipe.favorite.toggle()
        do {
            try modelContext.save()
            saveContext()
        } catch {
            print("Error saving context: \(error)")
        }
        fetchData()
        fetchFavorites()
    }
    
    func updateCategory(category: Category, newName: String) {
        guard !newName.isEmpty else { return }
        category.name = newName
        saveContext()
        fetchData()
    }


        
}
    
