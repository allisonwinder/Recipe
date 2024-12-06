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
                VStack(spacing: Constants.spacing) {

                    GroupBox(label: Label("Recipe Info", systemImage: EditorConstants.infoCircle)) {
                        VStack(alignment: .leading, spacing: Constants.padding) {
                            TextField("Recipe Name", text: $recipe.name)
                                .textFieldStyle(RoundedBorderTextFieldStyle())

                            TextField("Author", text: $recipe.author)
                                .textFieldStyle(RoundedBorderTextFieldStyle())

                            Stepper("Servings: \(recipe.servings)", value: $recipe.servings, in: EditorConstants.stepperMin...EditorConstants.stepperServingMax)

                            Stepper("Prep Time: \(recipe.time) minutes", value: $recipe.time, in: EditorConstants.stepperMin...EditorConstants.stepperTimeMax)

                            VStack(alignment: .leading) {
                                Text("Ingredients")
                                    .font(.headline)
                                Text("For the formatting to be correct, please start each new line with a tab and then a - for the ingredient.")
                                    .font(.subheadline)
                                TextEditor(text: $recipe.ingredients)
                                    .frame(height: EditorConstants.textEditorHeight)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: EditorConstants.cornerRadius)
                                            .stroke(.gray.opacity(EditorConstants.opacity), lineWidth: EditorConstants.linewidth)
                                    )
                                    .padding(.top, Constants.verticalPadding)
                            }

                            VStack(alignment: .leading) {
                                Text("Instructions")
                                    .font(.headline)
                                Text("For the formatting to be correct, please start each new line with a tab. If you want each sentence on a new line, then press enter and then tab.")
                                    .font(.subheadline)
                                TextEditor(text: $recipe.instructions)
                                    .frame(height: EditorConstants.textEditorHeight)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: EditorConstants.cornerRadius)
                                            .stroke(.gray.opacity(EditorConstants.opacity), lineWidth: EditorConstants.linewidth)
                                    )
                                    .padding(.top, Constants.verticalPadding)
                            }
                        }
                        .padding()
                    }

                    // Categories Section
                    GroupBox(label: Label("Categories", systemImage: EditorConstants.categoryTag)) {
                        VStack(alignment: .leading, spacing: Constants.padding) {
                            ForEach(recipe.categories) { category in
                                HStack {
                                    Text(category.name)
                                    Spacer()
                                    Button(action: {
                                        removeCategory(category)
                                    }) {
                                        Image(systemName: Constants.delete)
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
                    GroupBox(label: Label("Additional Info", systemImage: EditorConstants.ellipsis)) {
                        VStack(alignment: .leading, spacing: Constants.padding) {
                            Toggle("Favorite", isOn: $recipe.favorite)
                                
                            DatePicker("Date Added", selection: $recipe.dateAdded, displayedComponents: .date)
                            
                            Text("Notes")
                            Text("For the formatting to be correct, please start each new line with a tab If you want each sentence on a new line, then press enter and then tab.")
                                .font(.subheadline)
                            TextEditor(text: $recipe.notes)
                                .frame(height: EditorConstants.textEditorHeight)
                                .overlay(
                                    RoundedRectangle(cornerRadius: EditorConstants.cornerRadius)
                                        .stroke(.gray.opacity(EditorConstants.opacity), lineWidth: EditorConstants.linewidth)
                                )
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
    
    private func cancelEditing() {
        recipe = originalRecipe
        dismiss()
    }
    
    private func removeCategory(_ category: Category) {
        if let index = recipe.categories.firstIndex(of: category) {
            recipe.categories.remove(at: index)
            category.recipes.removeAll { $0.id == recipe.id }
        }
    }

    private func saveRecipe(unsavedRecipe: Recipe) {
        if case unsavedRecipe.name = "" {
            dismiss()
        } else {
            viewModel.saveRecipe(unsavedRecipe)
        }
        
    }

    private struct EditorConstants {
        static let categoryTag = "tag"
        static let cornerRadius: CGFloat = 8
        static let ellipsis = "ellipsis.circle"
        static let infoCircle = "info.circle"
        static let linewidth: CGFloat = 1
        static let opacity: CGFloat = 0.5
        static let stepperMin = 0
        static let stepperServingMax = 100
        static let stepperTimeMax = 720
        static let textEditorHeight: CGFloat = 200
    }
}







