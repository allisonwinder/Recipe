//
//  ContentView.swift
//  Recipe
//
//  Created by IS 543 on 11/15/24.
//

import SwiftUI
import SwiftData
import MarkdownUI

struct ContentView: View {
    @Environment(RecipeViewModel.self) private var viewModel
    @State private var recipeToEdit: Recipe?
    
    var exampleCategories: [Category]
    var exampleRecipes: [Recipe]
    
    init() {
        // Initialize categories
        self.exampleCategories = [
            Category(name: "All"),
            Category(name: "Breakfast"),
            Category(name: "Dessert"),
            Category(name: "Lunch"),
            Category(name: "Snacks"),
            Category(name: "Dinner")
        ]
        
        // Initialize recipes, referencing exampleCategories
        let recipe = Recipe(
            name: "Oatmeal Chocolate Chip and M&M Cookies",
            instructions: "Cook them",
            ingredients: "Cookies",
            categories: [exampleCategories[0], exampleCategories[2]], // Use "All" and "Dessert"
            servings: 10,
            time: 60,
            author: "Melanie Winder",
            dateAdded: ISO8601DateFormatter().date(from: "2024-11-25T00:00:00Z") ?? Date(),
            favorite: true,
            notes: "These are the best"
        )
        
        self.exampleRecipes = [recipe]
        
        // Add the recipe to the corresponding categories
        recipe.categories.forEach { category in
            category.recipes.append(recipe)
        }
    }
    
    
    
    var body: some View {
            NavigationSplitView {
                List {
                    ForEach(exampleCategories) { category in
                        NavigationLink {
                            // Filter the recipes by the selected category
                            List(category.recipes) { recipe in
                                NavigationLink {
                                    VStack(alignment: .leading, spacing: 10) {
                                        Markdown("# \(recipe.name)")
                                        Markdown(recipe.instructions)
                                        Markdown(recipe.ingredients)
                                        Button("Edit Recipe") {
                                            recipeToEdit = recipe
                                        }
                                        .buttonStyle(.bordered)
                                        .padding(.top)
                                    }
                                    .padding()
                                    .markdownTheme(.gitHub)
                                } label: {
                                    Text(recipe.name)
                                }

                            }
                        } label: {
                            Text(category.name)
                        }
                    }
                }
            } content: {
                List {
                    ForEach(exampleRecipes) { recipe in
                        NavigationLink {
                            VStack(alignment: .leading, spacing: 10) {
                                Markdown("# \(recipe.name)")
                                Markdown(recipe.instructions)
                                Markdown(recipe.ingredients)
                                Button("Edit Recipe") {
                                    recipeToEdit = recipe
                                }
                                .buttonStyle(.bordered)
                                .padding(.top)
                            }
                            .padding()
                            .markdownTheme(.gitHub)
                        } label: {
                            Text(recipe.name)
                        }
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        EditButton()
                    }
                    ToolbarItem {
                        Button(action: addItem) {
                            Label("Add Item", systemImage: "plus")
                        }
                    }
                }
            } detail: {
                Text("Select a recipe")
            }
            .sheet(item: $recipeToEdit) { recipe in
                RecipeEditorView(recipe: recipe)
            }
        }


    private func addItem() {
        withAnimation {
//            let newRecipe = Recipe(name: "#\(Date())", ingredient: "some **ingredients**", instructions: "some                        *instructions*")
 //           modelContext.insert(newRecipe)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
//            for index in offsets {
//                modelContext.delete(viewModel.recipes[index])
//            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Recipe.self, inMemory: true)
}
