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
    @Published var isAnimating = true
    @Published var isGameStarted = false
    @Published var timeRemaining = 30
    @Published var timer: Timer?
    @Published var timerSoundSetting: String = "timer1"
    @Published var gameMusic: String = "music1"
    @Published var timerSetting: Int = 30
    @Published var questions: [Question] = Question.questions
    
    func playMusic() {
        AudioManager.shared.playSound(named: gameMusic, volume: 0.4)
    }
    
    func randomQuestion() -> String {
        guard let question = questions.randomElement() else { return "Назовите зимний вид спорта" }
        return question.question
    }
    
    func startGame(navigate: @escaping () -> ()) {
        isGameStarted = true
        isAnimating = true
        animationAmount = 1.5
        AudioManager.shared.playSound(named: timerSoundSetting, volume: 0.8)
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            if self.timeRemaining > 0 {
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
            AudioManager.shared.stopSound(named: timerSoundSetting)
        } else {
            isAnimating = true
            animationAmount = 1.5
            AudioManager.shared.playSound(named: timerSoundSetting, volume: 0.8)
            
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
                guard let self = self else { return }
                if self.timeRemaining > 0 {
                    self.timeRemaining -= 1
                } else {
                    self.stopGame(navigate: navigate)
                }
            }
        }
    }
    
    /// Завершает игру и сбрасывает таймер при уничтожении объекта
    deinit {
        timer?.invalidate()
    }
}
