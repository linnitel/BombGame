//
//  Tasks.swift
//  BombGame
//
//  Created by Gerodot on 16.02.2025.
//

import Foundation

struct Task: Identifiable {
    var id = UUID()
    var title: String
}

extension Task {
    static let all: [Task] = [
        Task(title: "В следующем раунде после каждого ответа хлопать в ладоши"),
        Task(title: "Сделать 30 приседаний"),
        Task(title: "Поешь детскую песенку на стуле"),
        Task(title: "2 следующие игры делать всем комплименты"),
        Task(title: "Веди себя как цыпленок в течение 5 минут"),
        Task(title: "Выдайте себя за победителя"),
        Task(title: "Купи всем пиццу"),
        Task(title: "Смените аватарку на аватарку победителя на весь день"),
        Task(title: "Пусть противники определят ваш игровой никнейм"),
        Task(title: "Играйте след раунд стоя"),
    ]
}
