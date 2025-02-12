//
//  GameView.swift
//  BombGame
//
//  Created by Андрей Завадский on 11.02.2025.
//

import SwiftUI

struct GameView: View {
    @State private var isAnimating = true
    @State private var animationAmount = 1.0
    @State private var isGameStarted = false
    @State private var timeRemaining = 30
    @State private var timer: Timer?
    
    var body: some View {
        ZStack {
            Group {
                Color.gameBackground
                Image(.topographicGray)
                    .resizable()
            }
            .ignoresSafeArea()
            
            VStack {
                Text("Игра")
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .fontWeight(.bold)
                    .padding(.top, 20)
                
                Spacer()
                
                Text(isGameStarted ? "Назовите вид зимнего спорта" : "Нажмите “Запустить”\nчтобы начать игру")
                    .font(isGameStarted ? .system(size: 28, weight: .bold, design: .rounded) : .system(size: 28, weight: .regular, design: .rounded))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20)
                
                Text(isGameStarted ? "Осталось: \(timeRemaining) сек" : "")
                    .font(.system(size: 28, weight: .bold, design: .rounded))
                    .multilineTextAlignment(.center)
                    .padding(.top, 20)
                
                Spacer()
                
                Image("BombGameView")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 300)
                    .scaleEffect(animationAmount)
                    .animation(isAnimating ?
                        .easeInOut(duration: 1)
                        .repeatForever(autoreverses: true) : .none,
                               value: animationAmount
                    )
                
                Spacer()
                
                if !isGameStarted {
                    Button(action: {
                        startGame()
                    }) {
                        Text("Запустить")
                            .font(.system(size: 20, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(.gameViewButton)
                            .cornerRadius(12)
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 20)
                    
                } else {
                    Button(action: {
                        togglePause()
                        
                    }) {
                        Text(isAnimating ? "Пауза" : "Продолжить")
                            .font(.system(size: 20, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(isAnimating ? .green : .gameViewButton)
                            .cornerRadius(12)
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 20)
                }
            }
        }
        
    }
    
    private func startGame() {
        isGameStarted = true
        isAnimating = true
        animationAmount = 1.5
        timeRemaining = 10
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if timeRemaining > 0 {
                timeRemaining -= 1
            } else {
                stopGame()
            }
        }
    }
    
    private func stopGame() {
        isAnimating = false
        animationAmount = 1.0
        timer?.invalidate()
        timer = nil
        print("Взрыв")
    }
    
    private func togglePause() {
        if isAnimating {
            timer?.invalidate()
            timer = nil
            isAnimating = false
        } else {
            isAnimating = true
            animationAmount = 1.5 
            
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                if timeRemaining > 0 {
                    timeRemaining -= 1
                } else {
                    stopGame()
                }
            }
        }
    }
    
    
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
