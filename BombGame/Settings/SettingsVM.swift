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
    
    
    @Published var backgroundMusic: String = (UserDefaults.standard.string(forKey: "backgroundMusic") ?? "Мелодия1")
    @Published var bombSound: String = (UserDefaults.standard.string(forKey: "bombSound") ?? "Взрыв1")
    @Published var explosionSound: String = (UserDefaults.standard.string(forKey: "explosionSound") ?? "Часы1")
    
    
    @Published var vibration = UserDefaults.standard.bool(forKey: "vibration") { // AppStorage("")
        didSet {
            UserDefaults.standard.set(vibration, forKey: "vibration")
        }
    }
    @Published var gameForTasks = UserDefaults.standard.bool(forKey: "gameForTasks") {
        didSet {
            UserDefaults.standard.set(gameForTasks, forKey: "gameForTasks")
        }
    }
    
    var gameTime = UserDefaults.standard.value(forKey: "gameTime") ?? 30
    
    //MARK: - Settings func
    func setGameTime(time: Int) {
        gameTime = time
        UserDefaults.standard.set(time, forKey: "gameTime")
    }
    
    func setBackgroundMusic(music: String) {
        UserDefaults.standard.set(music, forKey: "backgroundMusic")
    }
    
    func setBombSound(sound: String) {
        UserDefaults.standard.set(sound, forKey: "bombSound")
    }
    
    func setExplosionSound(sound: String) {
        UserDefaults.standard.set(sound, forKey: "explosionSound")
    }
    
    
}

