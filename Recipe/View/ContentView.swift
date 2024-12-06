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
    @State private var newRecipeToEdit: Recipe?
    @State private var searchText: String = ""
    @State private var isEditing: Bool = false

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
                        Label("Manage Categories", systemImage: Constants.add)
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
        let recipesToDelete = offsets.map { recipes[$0] }
        for recipe in recipesToDelete {
            deleteRecipe(recipe)
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
                            Image(systemName: Constants.delete)
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
                    Label("Add Recipe", systemImage: Constants.add)
                }
            }
        }
        .searchable(text: $searchText)
    }
    
    
    
    private func recipeDetailView(recipe: Recipe) -> some View {
        ScrollView {
            VStack(alignment: .leading, spacing: Constants.spacing) {
                Markdown("# \(recipe.name)")
                    .font(.largeTitle)
                    .padding(.bottom, Constants.padding)
                
                HStack(spacing: Constants.padding) {
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
                        Image(systemName: recipe.favorite ? ContentConstants.filledHeart : ContentConstants.heart)
                            .foregroundColor(recipe.favorite ? .red : .gray)
                            .imageScale(.large)
                    }
                    .buttonStyle(.borderless)
                }
                .padding(.bottom, Constants.padding)
                
                if !recipe.categories.isEmpty {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: Constants.padding) {
                            ForEach(recipe.categories) { category in
                                Text(category.name)
                                    .font(.caption)
                                    .padding(.horizontal, Constants.padding)
                                    .padding(.vertical, Constants.verticalPadding)
                                    .background(Capsule().fill(.blue.opacity(ContentConstants.opacity)))
                                    .foregroundColor(.blue)
                            }
                        }
                        .padding(.bottom, Constants.padding)
                    }
                }
                
                Markdown("### Ingredients")
                Markdown(recipe.ingredients)
                    .padding(.bottom, Constants.padding)
                
                Markdown("### Instructions")
                Markdown(recipe.instructions)
                
            }
            .padding()
            .markdownTheme(.gitHub)

        }
        .toolbar {
            ToolbarItem {
                Button("Edit Recipe", systemImage: ContentConstants.pencil) {
                    recipeToEdit = recipe
                }
            }
        }
    }
    
    private struct ContentConstants {
        static let filledHeart = "heart.fill"
        static let heart = "heart"
        static let opacity: CGFloat = 0.2
        static let pencil = "pencil"
    }
    
}


#Preview {
    ContentView()
        .modelContainer(for: [Recipe.self, Category.self], inMemory: true)
}
