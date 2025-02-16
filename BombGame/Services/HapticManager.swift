//
//  HapticManager.swift
//  BombGame
//
//  Created by Gerodot on 16.02.2025.
//


import UIKit

class HapticManager {
    
    // MARK: - Singlton init
    static let shared = HapticManager()
    
    private init() {}
    
    // MARK: - Methods
    func playTick() {
        let generator = UIImpactFeedbackGenerator(style: .light)
        generator.prepare()
        generator.impactOccurred()
    }
    
    func playExplosion() {
        let generator = UIImpactFeedbackGenerator(style: .heavy)
        generator.prepare()
        generator.impactOccurred()
    }
    
    // MARK: - Additional Methods
    func playSuccess() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
    }
    
    func playError() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.error)
    }
}
