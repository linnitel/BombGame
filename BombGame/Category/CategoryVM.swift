//
//  CategoryViewModel.swift
//  BombGame
//
//  Created by Gerodot on 15.02.2025.
//


import SwiftUI

class CategoryViewModel: ObservableObject {
    @Published var categories = CategoryModel.all
    @Published var questions: [Question] = []

    // Собираем категории и фильтруем вопросы
    func addQuestionsToGame() {
        let selectedCategories = categories.filter { $0.isSelected }.map { $0.category }
        questions = Question.questions.filter { selectedCategories.contains($0.category) }
    }
}