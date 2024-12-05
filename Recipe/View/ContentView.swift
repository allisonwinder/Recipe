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
    @State private var isCategoryManagerPresented: Bool = false
    @State private var recipeToEdit: Recipe?
    @State private var newRecipeToEdit: Recipe?  // State for the new recipe
    @State private var searchText: String = ""
    @State private var isEditing: Bool = false // Track edit mode

    var body: some View {
        NavigationSplitView {
            List {
                Section(header: Text("Special Categories")) {
                    NavigationLink {
                        recipeListView(for: viewModel.favorites)
                    } label: {
                        Text("Favorites")
                    }
                }
                Section(header: Text("Other Categories")) {
                    ForEach(viewModel.allCategories) { category in
                        NavigationLink {
                            recipeListView(for: category.recipes)
                        } label: {
                            Text(category.name)
                        }
                    }
                }

            }
            .toolbar {
                ToolbarItem {
                    Button {
                        isCategoryManagerPresented = true
                    } label: {
                        Label("Manage Categories", systemImage: "tag")
                    }
                }
            }
        } content: {
            recipeListView(for: viewModel.allRecipes)
        } detail: {
            Text("Select a recipe")
        }
        .sheet(item: $recipeToEdit) { recipe in
            RecipeEditorView(recipe: recipe)
        }
        // Handle newRecipeToEdit as an Optional, with safe unwrapping
        .sheet(item: $newRecipeToEdit) { recipe in
            RecipeEditorView(recipe: recipe)
        }
        .sheet(isPresented: $isCategoryManagerPresented) {
            CategoryManagerView()
        }
    }

    private func addNewRecipe() {
        let newRecipe = Recipe(name: "", instructions: "", ingredients: "", categories: [], servings: 0, dateAdded: Date(), favorite: false,  notes: "" )
        newRecipeToEdit = newRecipe
    }
    
    private func deleteRecipe(_ recipe: Recipe) {
        viewModel.deleteRecipe(recipe)
    }
    
    private func deleteRecipes(at offsets: IndexSet, from recipes: [Recipe]) {
        // Map offsets to recipes
        let recipesToDelete = offsets.map { recipes[$0] }
        for recipe in recipesToDelete {
            deleteRecipe(recipe) // Delete each recipe using the viewModel
        }
    }

    private func getFilteredRecipes(from recipes: [Recipe]) -> [Recipe] {
        guard !searchText.isEmpty else { return recipes }
        return recipes.filter { recipe in
            recipe.name.localizedCaseInsensitiveContains(searchText) ||
            recipe.ingredients.localizedCaseInsensitiveContains(searchText) ||
            recipe.instructions.localizedCaseInsensitiveContains(searchText)
        }
    }

    
    private func toggleFavorite(for recipe: Recipe) {
        viewModel.toggleFavorite(recipe: recipe)
    }
    
    private func recipeListView(for recipes: [Recipe]) -> some View {
        
        let filteredRecipes = getFilteredRecipes(from: recipes)
        
        return List {
            ForEach (filteredRecipes) { recipe in
                if isEditing {
                    HStack {
                        Button(action: {
                            deleteRecipe(recipe)
                        }) {
                            Image(systemName: "minus.circle.fill")
                                .foregroundColor(.red)
                        }
                        Text(recipe.name)
                    }
                } else {
                    NavigationLink {
                        recipeDetailView(recipe: recipe)
                    } label: {
                        Text(recipe.name)
                    }
                }
            }
            .onDelete { offsets in
                deleteRecipes(at: offsets, from: filteredRecipes)
            }

        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(isEditing ? "Done" : "Edit") {
                    isEditing.toggle()
                }
            }
            ToolbarItem {
                Button(action: addNewRecipe) {
                    Label("Add Recipe", systemImage: "plus")
                }
            }
        }
        .searchable(text: $searchText)
    }
    
    private func recipeDetailView(recipe: Recipe) -> some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Recipe Name
                Markdown("# \(recipe.name)")
                    .font(.largeTitle)
                    .padding(.bottom, 10)
                
                // Recipe Metadata
                HStack(spacing: 10) {
                    Text("Author: \(recipe.author)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Text("Servings: \(recipe.servings)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Text("Time: \(recipe.time) min")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                            Text("Date Added: \(recipe.dateAdded.formatted())")
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                    
                    Spacer()
                    
                    Button(action: {
                        toggleFavorite(for: recipe)
                    }) {
                        Image(systemName: recipe.favorite ? "heart.fill" : "heart")
                            .foregroundColor(recipe.favorite ? .red : .gray)
                            .imageScale(.large)
                    }
                    .buttonStyle(.borderless)
                }
                .padding(.bottom, 10)
                
                // Categories as Chips
                if !recipe.categories.isEmpty {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(recipe.categories) { category in
                                Text(category.name)
                                    .font(.caption)
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 5)
                                    .background(Capsule().fill(.blue.opacity(0.2)))
                                    .foregroundColor(.blue)
                            }
                        }
                        .padding(.bottom, 10)
                    }
                }
                
                // Ingredients Section
                Markdown("### Ingredients")
                Markdown(recipe.ingredients) // Directly display the ingredients string
                    .padding(.bottom, 10)
                
                // Instructions Section
                Markdown("### Instructions")
                Markdown(recipe.instructions) // Directly display the instructions string
                
                // Edit Button
                Button("Edit Recipe") {
                    recipeToEdit = recipe
                }
                .buttonStyle(.bordered)
                .padding(.top)
            }
            .padding()
            .markdownTheme(.gitHub)

        }
    }
}


#Preview {
    ContentView()
        .modelContainer(for: [Recipe.self, Category.self], inMemory: true)
}
