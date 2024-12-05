//
//  CategoryManagerView.swift
//  Recipe
//
//  Created by IS 543 on 11/30/24.
//

import SwiftUI
import SwiftData

struct CategoryManagerView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(RecipeViewModel.self) private var viewModel
    @State private var newCategoryName: String = ""
    @State private var editingCategory: Category? = nil
    @State private var editedName: String = ""

    var body: some View {
        NavigationView {
            List {
                // List of categories
                ForEach(viewModel.allCategories) { category in
                    if editingCategory?.id == category.id {
                        // Inline editing mode
                        HStack {
                            TextField("Edit Name", text: $editedName)
                                .textFieldStyle(.roundedBorder)
                            Button("Save") {
                                saveEditedCategory()
                            }
                            .buttonStyle(.borderless)
                            Button("Cancel") {
                                editingCategory = nil
                            }
                            .buttonStyle(.borderless)
                        }
                    } else {
                        // Default display mode
                        HStack {
                            Text(category.name)
                            Spacer()
                            Button("Edit") {
                                startEditingCategory(category)
                            }
                            .buttonStyle(.borderless)
                            Button {
                                viewModel.deleteCategory(category: category)
                            } label: {
                                Image(systemName: "trash")
                                    .foregroundColor(.red)
                            }
                        }
                    }
                }

                // Add new category
                HStack {
                    TextField("New Category", text: $newCategoryName)
                        .textFieldStyle(.roundedBorder)
                    Button {
                        viewModel.addCategory(name: newCategoryName)
                        newCategoryName = ""
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .foregroundColor(.blue)
                    }
                    .disabled(newCategoryName.isEmpty)
                }
            }
            .navigationTitle("Manage Categories")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Close") {
                        dismiss()
                    }
                }
            }
        }
    }

    // MARK: - Methods
    private func startEditingCategory(_ category: Category) {
        editingCategory = category
        editedName = category.name
    }

    private func saveEditedCategory() {
        if let category = editingCategory {
            viewModel.updateCategory(category: category, newName: editedName)
            editingCategory = nil
        }
    }
}


