//
//  RecipeDetailView.swift
//  Recipe
//
//  Created by IS 543 on 12/3/24.
//

import SwiftUI
import SwiftData
import MarkdownUI

struct RecipeDetailView: View {
    @Environment(RecipeViewModel.self) private var viewModel
    @State private var recipeToEdit: Recipe?
    @State var recipe: Recipe
    
    var body: some View {
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
                    recipe.favorite.toggle() // Toggle favorite status
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
