//
//  CategoryModel.swift
//  BombGame
//
//  Created by Gerodot on 15.02.2025.
//


import SwiftUI

struct CategoryModel: Hashable, Identifiable {
    let id: UUID
    let name: String
    let category: Category
    let image: String
    var isSelected: Bool

    static var all: [CategoryModel] = [
        CategoryModel(id: UUID(), name: "О разном", category: .general, image: "RandomCategory", isSelected: false),
        CategoryModel(id: UUID(), name: "Знаменитости", category: .celebrities, image: "CelebritiesCategory", isSelected: false),
        CategoryModel(id: UUID(), name: "Про жизнь", category: .life, image: "LifeCategory", isSelected: false),
        CategoryModel(id: UUID(), name: "Спорт", category: .sport, image: "SportCategory", isSelected: false),
        CategoryModel(id: UUID(), name: "Искусство и Кино", category: .moviesAndArt, image: "ArtCategory", isSelected: false),
        CategoryModel(id: UUID(), name: "Природа", category: .nature, image: "NatureCategory", isSelected: false),
    ]
}