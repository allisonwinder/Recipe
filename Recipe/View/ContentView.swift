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
    
    var body: some View {
            NavigationSplitView {
                List {
                    // Create a list of distinct categories from all recipes
                    ForEach(distinctCategories(), id: \.self) { category in
                        NavigationLink {
                            // Filter the recipes by the selected category
                            RecipeListView(category: category)
                        } label: {
                            Text(category)
                        }
                    }
                }
            } content: {
                // List of recipes (could filter by category here as well)
                List {
                    ForEach(viewModel.recipes, id: \.id) { recipe in
                        NavigationLink {
                            VStack(alignment: .leading, spacing: 10) {
                                Markdown("# \(recipe.name)")
                                Markdown(recipe.instructions.map(\.instructionStep).joined(separator: "\n\n"))
                                Markdown(recipe.ingredients.map { "\($0.quantity) \($0.unit) \($0.name)" }.joined(separator: "\n"))
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
        }

        // Get distinct categories across all recipes
        private func distinctCategories() -> [String] {
            // Flatten categories from all recipes and remove duplicates
            let allCategories = viewModel.recipes.flatMap { $0.categories.map { $0.name } }
            return Array(Set(allCategories)).sorted()
        }


    private func addItem() {
        withAnimation {
//            let newRecipe = Recipe(name: "#\(Date())", ingredient: "some **ingredients**", instructions: "some *instructions*")
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

struct RecipeListView: View {
    var category: String
    @Environment(RecipeViewModel.self) private var viewModel

    var body: some View {
        List {
            ForEach(viewModel.recipes.filter { recipe in
                // Filter recipes by category name
                recipe.categories.contains { $0.name == category }
            }, id: \.id) { recipe in
                NavigationLink {
                    VStack(alignment: .leading, spacing: 10) {
                        Markdown("# \(recipe.name)")
                        Markdown(recipe.instructions.map(\.instructionStep).joined(separator: "\n\n"))
                        Markdown(recipe.ingredients.map { "\($0.quantity) \($0.unit) \($0.name)" }.joined(separator: "\n"))
                    }
                    .padding()
                    .markdownTheme(.gitHub)
                } label: {
                    Text(recipe.name)
                }
            }
        }
        .navigationTitle(category)
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Recipe.self, inMemory: true)
}
