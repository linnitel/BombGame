//
//  FinalViewVM.swift
//  BombGame
//
//  Created by Marat Fakhrizhanov on 11.02.2025.
//

import SwiftUI


class FinalViewVM: ObservableObject {
    
    @Published var currentTask = ""
    
    let tasks: [String] = ["В следующем раунде после каждого ответа хлопать в ладоши", "Сделать 30 приседаний", "Поешь детскую песенку на стуле", "2 следующие игры делать всем комплименты", "Веди себя как цыпленок в течение 5 минут", "Выдайте себя за победителя", "Купи всем пиццу", "Смените аватарку на аватарку победителя на весь день", "Пусть противники определят ваш игровой никнейм", "Играйте след раунд стоя"]
    // save in UD user-definedTask and appTask
    
    
    func uploadTask() {
        currentTask = tasks.filter{ $0 != currentTask }.randomElement() ?? "Пропускаешь одну игру - у разраба nil :)"
        print("uploadNewTask")
    }
    
	func newGame(navigation: @escaping () -> ()) {
        // go to new game View
        navigation()
    }
    
    func boom() {
        AudioManager.shared.playSound(named: "boom1", volume: 0.7, loops: 0)
    }
    
    
}
