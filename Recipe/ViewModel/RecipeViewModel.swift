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
        loadSampleData()
    }
    
    //MARK: - Model Access
    private(set) var recipes: [Recipe] = []
    
    private func fetchData() {
        try? modelContext.save()
        do {
            let descriptor = FetchDescriptor<Recipe>(sortBy: [SortDescriptor(\.name)])
            recipes = try modelContext.fetch(descriptor)
            print("Recipes fetched: \(recipes)")
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
    
    func loadSampleData() {
        // Load sample data without touching the network
        if let url = Bundle.main.url(forResource: "recipes", withExtension: "json") {
            if let data = try? Data(contentsOf: url) {
                updateStates(from: data)
            }
        }
    }
    
    private func addMockData() {
        guard recipes.isEmpty else {
            print("Mock data already exists.")
            return
        }
        let mockRecipe = Recipe(
            name: "Spaghetti Bolognese",
            instructions: [Instruction(stepNumber: 1, instructionStep: "Boil pasta."),
                           Instruction(stepNumber: 2, instructionStep: "Cook meat sauce.")],
            ingredients: [Ingredient(name: "Spaghetti", quantity: 500, unit: "g"),
                          Ingredient(name: "Ground Beef", quantity: 250, unit: "g"),
                          Ingredient(name: "Tomato Sauce", quantity: 200, unit: "ml")],
            servings: 4,
            time: 30,
            author: "Chef Test",
            favorite: false,
            notes: "A classic recipe."
        )
        modelContext.insert(mockRecipe)
        try? modelContext.save()
        print("Mock data added: \(mockRecipe)")
        fetchData()
    }
    
    private func updateStates(from data: Data) {
        // Parse JSON and update model context
        DispatchQueue.main.async {
            do {
                // Decode the JSON into an array of Recipe-like dictionaries
                guard let json = try JSONSerialization.jsonObject(with: data) as? [String: Any],
                      let recipesData = json["recipes"] as? [[String: Any]] else {
                    print("Invalid JSON structure")
                    return
                }

                // Fetch existing recipes to avoid duplication
                let existingRecipes = Set(self.recipes.map { $0.id })

                // Process the incoming data
                for recipeData in recipesData {
                    guard let idString = recipeData["id"] as? String,
                          let id = UUID(uuidString: idString),
                          let name = recipeData["name"] as? String,
                          let servings = recipeData["servings"] as? Int,
                          let time = recipeData["time"] as? Int,
                          let author = recipeData["author"] as? String,
                          let favorite = recipeData["favorite"] as? Bool,
                          let notes = recipeData["notes"] as? String else {
                        print("Incomplete or invalid recipe data: \(recipeData)")
                        continue
                    }

                    // Check if the recipe already exists
                    if existingRecipes.contains(id) {
                        print("Recipe with ID \(id) already exists. Skipping...")
                        continue
                    }

                    // Create a new Recipe object
                    let newRecipe = Recipe(
                        name: name,
                        servings: servings,
                        time: time,
                        author: author,
                        favorite: favorite,
                        notes: notes
                    )

                    // Add instructions if available
                    if let instructionData = recipeData["instructions"] as? [[String: Any]] {
                        for instruction in instructionData {
                            if let stepNumber = instruction["stepNumber"] as? Int,
                               let instructionStep = instruction["instructionStep"] as? String {
                                let newInstruction = Instruction(
                                    stepNumber: stepNumber,
                                    instructionStep: instructionStep,
                                    recipe: newRecipe
                                )
                                newRecipe.instructions.append(newInstruction)
                            }
                        }
                    }

                    // Add ingredients if available
                    if let ingredientData = recipeData["ingredients"] as? [[String: Any]] {
                        for ingredient in ingredientData {
                            if let name = ingredient["name"] as? String,
                               let quantity = ingredient["quantity"] as? Double,
                               let unit = ingredient["unit"] as? String {
                                let newIngredient = Ingredient(
                                    name: name,
                                    quantity: quantity,
                                    unit: unit,
                                    recipe: newRecipe
                                )
                                newRecipe.ingredients.append(newIngredient)
                            }
                        }
                    }

                    // Insert the recipe into the model context
                    self.modelContext.insert(newRecipe)
                }

                // Save the context
                try self.modelContext.save()

            } catch {
                print("Failed to parse or update states: \(error)")
            }
        }
    }

    
    //MARK: - User Intents
    
    
}
