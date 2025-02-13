//
//  GameViewModel.swift
//  BombGame
//
//  Created by Андрей Завадский on 13.02.2025.
//
import SwiftUI

class GameViewModel: ObservableObject {
    @Published var isAnimating = true
    @Published var animationAmount = 1.0
    @Published var isGameStarted = false
    @Published var timeRemaining = 30
    @Published var timer: Timer?
    
    func startGame() {
        isGameStarted = true
        isAnimating = true
        animationAmount = 1.5
        timeRemaining = 30
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [self] _ in
            if timeRemaining > 0 {
                timeRemaining -= 1
            } else {
                stopGame()
            }
        }
    }
    
    func stopGame() {
        isAnimating = false
        animationAmount = 1.0
        timer?.invalidate()
        timer = nil
        print("Взрыв")
    }
    
    func togglePause() {
        if isAnimating {
            timer?.invalidate()
            timer = nil
            isAnimating = false
        } else {
            isAnimating = true
            animationAmount = 1.5 // Перезапуск анимации
            
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [self] _ in
                if timeRemaining > 0 {
                    timeRemaining -= 1
                } else {
                    stopGame()
                }
            }
        }
    }
    
    
}
