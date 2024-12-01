//
//  RecipeEditorView.swift
//  Recipe
//
//  Created by IS 543 on 11/29/24.
//

import SwiftUI
import SwiftData
import MarkdownUI

struct RecipeEditorView: View {
    @Environment(RecipeViewModel.self) private var viewModel
    @Environment(\.dismiss) private var dismiss
    @State var recipe: Recipe

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Recipe Info")) {
                    TextField("Name", text: $recipe.name)
                    TextField("Author", text: $recipe.author)
                    Stepper("Servings: \(recipe.servings)", value: $recipe.servings, in: 1...100)
                    TextField("Ingredients", text: $recipe.ingredients)
                    TextEditor(text: $recipe.instructions)
                        .frame(height: 200)
                }

                Section(header: Text("Additional Info")) {
                    Toggle("Favorite", isOn: $recipe.favorite)
                    DatePicker("Date Added", selection: $recipe.dateAdded, displayedComponents: .date)
                    TextField("Notes", text: $recipe.notes)
                }
            }
            .navigationTitle("Edit Recipe")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        saveRecipe(recipe)
                        dismiss()
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }


    
    private func saveRecipe(_ recipe: Recipe) {
        viewModel.saveRecipe(recipe)
        print("Made it to part one")
    }
}

