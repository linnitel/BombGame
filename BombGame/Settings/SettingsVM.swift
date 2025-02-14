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
    
    @State var backgroundMusic = "Мелодия1"
    @State var bombSound = "Часы1"
    @State var explosionSound = "Взрыв1"

    @State var vibration = true
    @State var gameForTasks = false
    
    var gameTime = 30     // 10 - 30 - 60 - random(20...120)seconds
    
    func setGameTime(time: Int) {
        gameTime = time
        print(gameTime)
    }
    
    
}

