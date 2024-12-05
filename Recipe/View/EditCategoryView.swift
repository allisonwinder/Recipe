//
//  EditCategoryView.swift
//  Recipe
//
//  Created by IS 543 on 11/30/24.
//

import SwiftUI

struct EditCategoryView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(RecipeViewModel.self) private var viewModel
    @Bindable var category: Category
    @State private var newName: String = ""

    var body: some View {
        NavigationView {
            Form {
                TextField("Category Name", text: $newName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .navigationTitle("Edit Category")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        saveChanges()
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
        .onAppear {
            newName = category.name
        }
    }

    private func saveChanges() {
        viewModel.updateCategory(category: category, newName: newName)
    }
}


