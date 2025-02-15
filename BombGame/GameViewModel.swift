//
//  GameViewModel.swift
//  BombGame
//
//  Created by Андрей Завадский on 13.02.2025.
//
import SwiftUI
import AVFoundation

class GameViewModel: ObservableObject {
    
    @Published var isAnimating = true
    @Published var animationAmount = 1.0
    @Published var isGameStarted = false
    @Published var timeRemaining = UserDefaults.standard.integer(forKey: "gameTime")
    @Published var timer: Timer?
    
    func startGame(navigate: @escaping () -> ()) {
        AudioManager.shared.playSound(named: "Часы", volume: 0.6)
        isGameStarted = true
        isAnimating = true
        animationAmount = 1.5
        timeRemaining = UserDefaults.standard.integer(forKey: "gameTime")
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [self] _ in
            if timeRemaining > 0 {
                timeRemaining -= 1
            } else {
                stopGame(navigate: navigate)
            }
        }
    }
    
    func stopGame(navigate: @escaping () -> ()) {
        isAnimating = false
        animationAmount = 1.0
        timer?.invalidate()
        timer = nil
        navigate()
        AudioManager.shared.stopAllSounds()
    }
    
    func togglePause(navigate: @escaping () -> ()) {
        if isAnimating {
            timer?.invalidate()
            timer = nil
            isAnimating = false
            AudioManager.shared.stopSound(named: "Часы")
        } else {
            isAnimating = true
            animationAmount = 1.5
            AudioManager.shared.playSound(named: "Часы", volume: 0.8)
            
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [self] _ in
                if timeRemaining > 0 {
                    timeRemaining -= 1
                } else {
                    stopGame(navigate: navigate)
                }
            }
        }
    }
    
}
