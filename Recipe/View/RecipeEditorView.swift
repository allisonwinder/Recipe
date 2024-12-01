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

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 16) {
                    // Recipe Information Section
                    Section(header: Text("Recipe Info")) {
                        TextField("Name", text: $recipe.name)
                        TextField("Author", text: $recipe.author)
                        Stepper("Servings: \(recipe.servings)", value: $recipe.servings, in: 1...100)
                        TextField("Ingredients", text: $recipe.ingredients)
                        TextEditor(text: $recipe.instructions)
                            .frame(height: 200)
                            .border(Color.gray, width: 1)
                    }
                    
                    // Categories Section
                    Section(header: Text("Categories")) {
                        // List of pre-existing categories associated with the recipe
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
                        
                        // Drop-down Picker to add a new category
                        Picker("Add Category", selection: $selectedCategory) {
                            Text("Select Category").tag(nil as Category?)  // First option with nil
                            ForEach(viewModel.allCategories) { category in
                                Text(category.name).tag(category as Category?)
                            }
                        }
                        .pickerStyle(MenuPickerStyle())  // Drop-down style
                        .onChange(of: selectedCategory) {
                            addCategory(selectedCategory)
                        }
                        
                        //New Category Input
                        TextField("New Category Name", text: $newCategoryName)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.top)
                        
                        Button(action: addNewCategory) {
                            Text("Add New Category")
                                .foregroundStyle(.blue)
                        }
                        .padding(.top)

                    }
                    
                    // Additional Info Section
                    Section(header: Text("Additional Info")) {
                        Toggle("Favorite", isOn: $recipe.favorite)
                        DatePicker("Date Added", selection: $recipe.dateAdded, displayedComponents: .date)
                        TextField("Notes", text: $recipe.notes)
                    }
                }
                .padding()
            }
            .navigationTitle("Edit Recipe")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        saveRecipe()
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
    private func saveRecipe() {
        viewModel.saveRecipe(recipe)  // Call the view model's save function to persist the recipe
    }
}



