//
//  SettingsVM.swift
//  BombGame
//
//  Created by Marat Fakhrizhanov on 14.02.2025.
//

import SwiftUI

class SettingsVM: ObservableObject {
    
    let backgroundSounds = ["Мелодия1", "Мелодия2", "Мелодия3"]
    let bombSounds = ["Часы1", "Часы2", "Часы3"]
    let explosionSounds = ["Взрыв1", "Взрыв2", "Взрыв3"]
    
    @Published var backgroundMusic = "Мелодия1" { didSet{print(gameTime)}}
    @Published var bombSound = "Часы1"
    @Published var explosionSound = "Взрыв1"

    @Published var vibration = true 
    @Published var gameForTasks = true
    
    var gameTime = 30   // { didSet{print(gameTime)}} // 10 - 30 - 60 - random(20...120)seconds
    
    func setGameTime(time: Int) {
        gameTime = time
    }
    
    
}

