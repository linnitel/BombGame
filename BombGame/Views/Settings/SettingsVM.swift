//
//  SettingsVM.swift
//  BombGame
//
//  Created by Marat Fakhrizhanov on 14.02.2025.
//

import SwiftUI

class SettingsVM: ObservableObject {
    
    let backgroundSounds = ["music1", "music2", "music3"]
    let bombSounds = ["timer1", "timer2", "timer3"]
    let explosionSounds = ["boom1", "boom2", "boom3"]
    
    // AppStorage("") test
    @Published var backgroundMusic: String = (UserDefaults.standard.string(forKey: "backgroundMusic") ?? "music1")
    @Published var bombSound: String = (UserDefaults.standard.string(forKey: "bombSound") ?? "boom1")
    @Published var explosionSound: String = (UserDefaults.standard.string(forKey: "explosionSound") ?? "timer1")
    
    
    @Published var vibration = UserDefaults.standard.bool(forKey: "vibration") {
        didSet {
            SettingsManager.shared.updateVibrationToggle(vibration)
            UserDefaults.standard.set(vibration, forKey: "vibration")
        }
    }
    @Published var gameForTasks = UserDefaults.standard.bool(forKey: "gameForTasks") {
        didSet {
            SettingsManager.shared.updateTasksToglle(gameForTasks)
            UserDefaults.standard.set(gameForTasks, forKey: "gameForTasks")
        }
    }
    
    var gameTime = UserDefaults.standard.value(forKey: "gameTime") ?? 20
    
    //MARK: - Settings func
    func setGameTime(time: Int) {
        gameTime = time
        SettingsManager.shared.updateTimerDuration(time)
        UserDefaults.standard.set(time, forKey: "gameTime")
    }
    
    func setBackgroundMusic(music: String) {
        SettingsManager.shared.updateGameMusic(music)
        UserDefaults.standard.set(music, forKey: "backgroundMusic")
    }
    
    func setBombSound(sound: String) {
        SettingsManager.shared.updateTimerSound(sound)
        UserDefaults.standard.set(sound, forKey: "bombSound")
    }
    
    func setExplosionSound(sound: String) {
        SettingsManager.shared.updateBoomSound(sound)
        UserDefaults.standard.set(sound, forKey: "explosionSound")
    }
    
    
}

