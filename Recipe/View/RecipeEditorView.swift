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
    @Environment(\.dismiss) private var dismiss
    @Environment(RecipeViewModel.self) private var viewModel
    @State var recipe: Recipe
    @State private var selectedCategory: Category? = nil
    @State private var newCategoryName: String = ""
    @State private var originalRecipe: Recipe // Backup of the original recipe

    init(recipe: Recipe) {
        _recipe = State(initialValue: recipe)
        _originalRecipe = State(initialValue: recipe) // Initialize backup
    }

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    // Recipe Information Section
                    GroupBox(label: Label("Recipe Info", systemImage: "info.circle")) {
                        VStack(alignment: .leading, spacing: 10) {
                            TextField("Recipe Name", text: $recipe.name)
                                .textFieldStyle(RoundedBorderTextFieldStyle())

                            TextField("Author", text: $recipe.author)
                                .textFieldStyle(RoundedBorderTextFieldStyle())

                            Stepper("Servings: \(recipe.servings)", value: $recipe.servings, in: 0...100)

                            Stepper("Prep Time: \(recipe.time) minutes", value: $recipe.time, in: 0...720)

                            VStack(alignment: .leading) {
                                Text("Ingredients")
                                    .font(.headline)
                                TextEditor(text: $recipe.ingredients)
                                    .frame(height: 150)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                                    )
                                    .padding(.top, 5)
                            }

                            VStack(alignment: .leading) {
                                Text("Instructions")
                                    .font(.headline)
                                TextEditor(text: $recipe.instructions)
                                    .frame(height: 200)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                                    )
                                    .padding(.top, 5)
                            }
                        }
                        .padding()
                    }

                    // Categories Section
                    GroupBox(label: Label("Categories", systemImage: "tag")) {
                        VStack(alignment: .leading, spacing: 10) {
                            ForEach(recipe.categories) { category in
                                HStack {
                                    Text(category.name)
                                    Spacer()
                                    Button(action: {
                                        removeCategory(category)
                                    }) {
                                        Image(systemName: "minus.circle.fill")
                                            .foregroundColor(.red)
                                    }
                                }
                            }

                            Picker("Add Category", selection: $selectedCategory) {
                                Text("Select Category").tag(nil as Category?)
                                ForEach(viewModel.allCategories) { category in
                                    Text(category.name).tag(category as Category?)
                                }
                            }
                            .pickerStyle(MenuPickerStyle())
                            .onChange(of: selectedCategory) {
                                if let selectedCategory = selectedCategory {
                                    addCategory(selectedCategory)
                                }
                            }

                            HStack {
                                TextField("New Category Name", text: $newCategoryName)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                Button("Add") {
                                    addNewCategory()
                                }
                                .buttonStyle(.borderedProminent)
                            }
                        }
                        .padding()
                    }

                    // Additional Info Section
                    GroupBox(label: Label("Additional Info", systemImage: "ellipsis.circle")) {
                        VStack(alignment: .leading, spacing: 10) {
                            Toggle("Favorite", isOn: $recipe.favorite)

                            DatePicker("Date Added", selection: $recipe.dateAdded, displayedComponents: .date)

                            TextField("Notes", text: $recipe.notes)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                        .padding()
                    }
                }
                .padding()
            }
            .navigationTitle( "\(recipe.name.isEmpty ? "New Recipe" : "Edit Recipe" )")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        saveRecipe(unsavedRecipe: recipe)
                        dismiss()
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        cancelEditing() // Call to cancel
                    }
                }
            }
        }
    }

    // Remove a category from the recipe
    private func removeCategory(_ category: Category) {
        if let index = recipe.categories.firstIndex(of: category) {
            recipe.categories.remove(at: index)
            category.recipes.removeAll { $0.id == recipe.id }
        }
    }

    // Add a new category to the recipe
    private func addCategory(_ category: Category?) {
        if let category = category, !recipe.categories.contains(category) {
            recipe.categories.append(category)
            category.recipes.append(recipe)
        }
    }

    private func addNewCategory() {
        guard !newCategoryName.isEmpty else { return }

        let newCategory = Category(name: newCategoryName, recipes: [recipe])
        recipe.categories.append(newCategory)
        newCategoryName = ""
    }

    // Save the recipe and update the model
    private func saveRecipe(unsavedRecipe: Recipe) {
        if case unsavedRecipe.name = "" {
            dismiss()
        } else {
            viewModel.saveRecipe(unsavedRecipe)
        }
        
    }

    // Handle the cancel action: revert changes to the original recipe
    private func cancelEditing() {
        recipe = originalRecipe // Restore the original recipe
        dismiss() // Dismiss the editor view
    }
}







