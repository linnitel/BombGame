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
    
    private init() {}
    
    // MARK: - Properies
    // Audio
    var gameMusic: String = "music1"
    var timerSound: String = "timer1"
    var boomSound: String = "boom1"
    
    // Duratrion
    var timerDuration: Int = 30
    
    //Questions
    var selectedQuestions: [Question] = Question.questions
    
    // Vibratin
    var vibration: Bool = true
    
    // Quests
    var tasks: Bool = true
    
    // MARK: - Methods
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
    
    func updateTimerDuration(_ duration: Int) {
        timerDuration = duration
    }
}
