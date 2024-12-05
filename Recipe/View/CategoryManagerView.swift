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
                        HStack(spacing: 12) {
                            TextField("Edit Name", text: $editedName)
                                .textFieldStyle(.roundedBorder)
                                .padding(.vertical, 4)
                            Button {
                                saveEditedCategory()
                            } label: {
                                Label("Save", systemImage: "checkmark.circle.fill")
                                    .foregroundColor(.green)
                                    .labelStyle(.iconOnly)
                            }
                            .buttonStyle(.plain)
                            Button {
                                cancelEditing()
                            } label: {
                                Label("Cancel", systemImage: "xmark.circle.fill")
                                    .foregroundColor(.red)
                                    .labelStyle(.iconOnly)
                            }
                            .buttonStyle(.plain)
                        }
                        .padding(.vertical, 4)
                    } else {
                        // Default display mode
                        HStack(spacing: 12) {
                            Text(category.name)
                                .font(.headline)
                            Spacer()
                            Button {
                                startEditingCategory(category)
                            } label: {
                                Label("Edit", systemImage: "pencil.circle.fill")
                                    .foregroundColor(.blue)
                                    .labelStyle(.iconOnly)
                            }
                            .buttonStyle(.plain)
                            Button {
                                viewModel.deleteCategory(category: category)
                            } label: {
                                Label("Delete", systemImage: "trash.circle.fill")
                                    .foregroundColor(.red)
                                    .labelStyle(.iconOnly)
                            }
                            .buttonStyle(.plain)
                        }
                        .padding(.vertical, 4)
                    }
                }

                // Add new category
                HStack(spacing: 12) {
                    TextField("New Category", text: $newCategoryName)
                        .textFieldStyle(.roundedBorder)
                        .padding(.vertical, 4)
                    Button {
                        addNewCategory()
                    } label: {
                        Label("Add", systemImage: "plus.circle.fill")
                            .foregroundColor(.blue)
                            .labelStyle(.iconOnly)
                    }
                    .buttonStyle(.plain)
                    .disabled(newCategoryName.isEmpty)
                }
                .padding(.vertical, 4)
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

    private func cancelEditing() {
        editingCategory = nil
    }

    private func addNewCategory() {
        viewModel.addCategory(name: newCategoryName)
        newCategoryName = ""
    }
}



