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

    var body: some View {
        NavigationSplitView {
            List {
                Section(header: Text("Special Categories")) {
                    NavigationLink {
                        List(viewModel.favorites) { recipe in
                            NavigationLink {
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
                                        // Favorite Toggle
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
                            } label: {
                                Text(recipe.name)
                            }
                        }
                    } label: {
                        Text("Favorites")
                    }
                }
                ForEach(viewModel.allCategories) { category in
                    NavigationLink {
                        // Filter the recipes by the selected category
                        List(category.recipes) { recipe in
                            NavigationLink {
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
                                        // Favorite Toggle
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
                            } label: {
                                Text(recipe.name)
                            }
                        }
                    } label: {
                        Text(category.name)
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
            List {
                ForEach(viewModel.allRecipes) { recipe in
                    NavigationLink {
                        //RecipeDetailView(recipe: recipe)
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
                    Button(action: addNewRecipe) {
                        Label("Add Recipe", systemImage: "plus")
                    }
                }
            }
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
        let newRecipe = Recipe(name: "", instructions: "", ingredients: "", categories: [], servings: 1, dateAdded: Date(), favorite: false,  notes: "" )
        newRecipeToEdit = newRecipe
    }
    
    private func toggleFavorite(for recipe: Recipe) {
        viewModel.toggleFavorite(recipe: recipe)
    }
}


#Preview {
    ContentView()
        .modelContainer(for: [Recipe.self, Category.self], inMemory: true)
}
