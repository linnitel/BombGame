//
//  GameViewModel.swift
//  BombGame
//
//  Created by Андрей Завадский on 13.02.2025.
//
import SwiftUI
import AVFoundation

class GameViewModel: ObservableObject {
    private var backgroundMusicPlayer: AVAudioPlayer?
    private var tickingSoundPlayer: AVAudioPlayer?
    
    @Published var isAnimating = true
    @Published var animationAmount = 1.0
    @Published var isGameStarted = false
    @Published var timeRemaining = 30
    @Published var timer: Timer?
    
	func startGame(navigate: @escaping () -> ()) {
        playTickingSound()
        isGameStarted = true
        isAnimating = true
        animationAmount = 1.5
        timeRemaining = 10
        
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
        stopSounds()
        backgroundMusicPlayer?.stop()
    }
    
    func togglePause(navigate: @escaping () -> ()) {
        if isAnimating {
            timer?.invalidate()
            timer = nil
            isAnimating = false
            stopSounds()
        } else {
            isAnimating = true
            animationAmount = 1.5
            
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [self] _ in
                if timeRemaining > 0 {
                    timeRemaining -= 1
                } else {
					stopGame(navigate: navigate)
                }
            }
        }
    }
    
    func playBackgroundMusic() {
        guard let url = Bundle.main.url(forResource: "giggleAllDay", withExtension: "mp3") else {
            print("Файл giggleAllDay.mp3 не найден")
            return
        }
        
        DispatchQueue.global(qos: .background).async { [self] in
            do {
                backgroundMusicPlayer = try AVAudioPlayer(contentsOf: url)
                backgroundMusicPlayer?.numberOfLoops = -1
                backgroundMusicPlayer?.volume = 0.4
                backgroundMusicPlayer?.play()
            } catch {
                print("Ошибка воспроизведения фоновой музыки: \(error.localizedDescription)")
            }
        }
    }

    func playTickingSound() {
        guard let url = Bundle.main.url(forResource: "taymerChasyi", withExtension: "mp3") else {
            print("Файл bombTimer.m4r не найден")
            return
        }
        
        DispatchQueue.main.async { [self] in
            do {
                tickingSoundPlayer = try AVAudioPlayer(contentsOf: url)
                tickingSoundPlayer?.numberOfLoops = -1
                tickingSoundPlayer?.volume = 0.8
                tickingSoundPlayer?.play()
            } catch {
                print("Ошибка воспроизведения тикающего звука: \(error.localizedDescription)")
            }
        }
    }

    private func stopSounds() {
        
        tickingSoundPlayer?.stop()
    }
    
}
