//
//  GameViewModel.swift
//  BombGame
//
//  Created by Андрей Завадский on 13.02.2025.
//
import SwiftUI
import AVFoundation

class GameViewModel: ObservableObject {
    @Published var animationAmount = 1.0
    @Published var isAnimating: Bool = true
    @Published var isGameStarted: Bool = false
    @Published var isMute: Bool = SettingsManager.shared.isMuted
    @Published var timeRemaining: Int = 30
    @Published var timer: Timer?
    @Published var timerSound: String = SettingsManager.shared.timerSound
    @Published var gameMusic: String = SettingsManager.shared.gameMusic
    @Published var timerSetting: Int = SettingsManager.shared.timerDuration
    @Published var questions: [Question] = SettingsManager.shared.selectedQuestions

    
    func playMusic() {
        AudioManager.shared.playSound(named: gameMusic, volume: 0.4)
    }
    
    func stopMusic() {
        AudioManager.shared.stopSound(named: gameMusic)
    }
    
    func randomQuestion() -> String {
        guard let question = questions.randomElement() else { return "Назовите зимний вид спорта" }
        SettingsManager.shared.updateSelectedQuestions(questions, questionToRemove: question)
        return question.question
    }
    
    func startGame(navigate: @escaping () -> ()) {
        isGameStarted = true
        isAnimating = true
        animationAmount = 1.5

        AudioManager.shared.playSound(named: timerSound, volume: 0.8)
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            if self.timeRemaining > 0 {
                if SettingsManager.shared.isVibration {
                    HapticManager.shared.playTick()
                }
                self.timeRemaining -= 1
            } else {
                self.stopGame(navigate: navigate)
            }
        }
    }
    
    func stopGame(navigate: @escaping () -> ()) {
        isAnimating = false
        animationAmount = 1.0
        timer?.invalidate()
        timer = nil
        isGameStarted = false
        timeRemaining = timerSetting
        AudioManager.shared.stopAllSounds()
        navigate()
    }
    
    func togglePause(navigate: @escaping () -> ()) {
        if isAnimating {
            timer?.invalidate()
            timer = nil
            isAnimating = false
            animationAmount = 1.0
            AudioManager.shared.stopSound(named: timerSound)
        } else {
            isAnimating = true
            animationAmount = 1.5
            AudioManager.shared.playSound(named: timerSound, volume: 0.8)
            
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
                guard let self = self else { return }
                if self.timeRemaining > 0 {
                    HapticManager.shared.playTick()
                    self.timeRemaining -= 1
                } else {
                    self.stopGame(navigate: navigate)
                }
            }
        }
    }
    
    func musicMuteToggle () {
        isMute.toggle()
        SettingsManager.shared.musicMuteToggle()
        if isMute {
            stopMusic()
        } else {
            playMusic()
        }
    }
    
    /// Завершает игру и сбрасывает таймер при уничтожении объекта
    deinit {
        timer?.invalidate()
    }
}
