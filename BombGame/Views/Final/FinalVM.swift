//
//  FinalViewVM.swift
//  BombGame
//
//  Created by Marat Fakhrizhanov on 11.02.2025.
//

import SwiftUI

class FinalViewVM: ObservableObject {
    
    @Published var currentTask: Task?
    
    let tasks: [Task] = Task.all
    
    func uploadTask() {
        currentTask = tasks.filter { $0.id != currentTask?.id }.randomElement() ?? Task(title: "Пропускаешь одну игру - у разраба nil :)")
        print("uploadNewTask")
    }
    
    func newGame(navigation: @escaping () -> ()) {
        // go to new game View
        navigation()
    }
    
    func boom() {
        AudioManager.shared.playSound(named: "boom1", volume: 0.7, loops: 0)
        if SettingsManager.shared.isVibration {
            HapticManager.shared.playExplosion()
        }
    }
}
