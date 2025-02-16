//
//  GameDataManager.swift
//  BombGame
//
//  Created by Gerodot on 16.02.2025.
//

import Foundation

class SettingsManager {
    
    // MARK: - Singlton init
    static let shared = SettingsManager()
    
    private init() {
        loadSettings()
    }
    
    // MARK: - Properies
    // Audio
    var gameMusic: String = "music1"
    var timerSound: String = "timer1"
    var boomSound: String = "boom1"
    var isMuted: Bool = false
    
    // Duratrion
    var timerDuration: Int = 30
    
    //Questions
    var selectedQuestions: [Question] = Question.questions
    
    // Vibratin
    var isVibration: Bool = true
    
    // Quests
    var isTasks: Bool = true
    
    // MARK: - Public Methods
    func updateSelectedQuestions(_ questions: [Question], questionToRemove: Question? = nil) {
        var updatedQuestions = questions
        
        if let questionToRemove = questionToRemove {
            updatedQuestions.removeAll { $0.id == questionToRemove.id }
        }
        
        if updatedQuestions.isEmpty {
            selectedQuestions = Question.questions
        } else {
            selectedQuestions = updatedQuestions
        }
    }
    
    func updateGameMusic(_ music: String) {
        gameMusic = music
    }
    
    func updateTimerSound(_ sound: String) {
        timerSound = sound
    }
    
    func updateBoomSound(_ sound: String) {
        boomSound = sound
    }
    
    func musicMuteToggle () {
        isMuted.toggle()
    }
    
    func updateTimerDuration(_ duration: Int) {
        timerDuration = duration
    }
    
    func updateVibrationToggle (_ vibration: Bool) {
        isVibration = vibration
    }
    
    func updateTasksToglle (_ tasks: Bool ) {
        isTasks = tasks
    }
    
    // MARK: - Private Methods
    private func loadSettings() {
        // Загружаем значения из UserDefaults
        isVibration = UserDefaults.standard.value(forKey: "vibration") as? Bool ?? true
        isTasks = UserDefaults.standard.value(forKey: "gameForTasks") as? Bool ?? true
        timerDuration = UserDefaults.standard.value(forKey: "gameTime") as? Int ?? 20
        gameMusic = UserDefaults.standard.value(forKey: "backgroundMusic") as? String ?? "music1"
        timerSound = UserDefaults.standard.value(forKey: "bombSound") as? String ?? "timer1"
        boomSound = UserDefaults.standard.value(forKey: "explosionSound") as? String ?? "boom1"
    }
}
