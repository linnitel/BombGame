//
//  GameView.swift
//  BombGame
//
//  Created by Андрей Завадский on 11.02.2025.
//

import SwiftUI
import SwiftUIPausableAnimation

struct GameView: View {
    @State private var isPaused = false
    @State private var animationAmount: CGFloat = 1.0
    
    private let duration: TimeInterval = 1.0
    private let minScale: CGFloat = 1.0
    private let maxScale: CGFloat = 1.4
    
    private var remainingDuration: RemainingDurationProvider<CGFloat> {
        { _ in
            return CGFloat(duration) // Всегда возвращаем фиксированное значение
        }
    }
    
    private let animation: AnimationWithDurationProvider = { duration in
            .easeInOut(duration: duration)
    }
    
    @StateObject private var gameViewModel = GameViewModel()
    @Binding var path: NavigationPath
    @State private var question: String = ""
    
    var body: some View {
        ZStack {
            // Фон
            Group {
                Color.gameBackground
                Image(.topographicGray)
                    .resizable()
            }
            .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text(gameViewModel.isGameStarted ? question : "Нажмите “Запустить”\nчтобы начать игру")
                    .font(.system(size: 28, weight: gameViewModel.isGameStarted ? .bold : .regular, design: .rounded))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20)
                
                Text(gameViewModel.isGameStarted ? "Осталось: \(gameViewModel.timeRemaining) сек" : "")
                    .font(.system(size: 28, weight: .bold, design: .rounded))
                    .multilineTextAlignment(.center)
                    .padding(.top, 20)
                
                Spacer()
                
                Image("BombGameView")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 300)
                    .scaleEffect(animationAmount)
                    .pausableAnimation(
                        binding: $animationAmount,
                        targetValue: maxScale,
                        remainingDuration: remainingDuration,
                        animation: animation,
                        paused: $isPaused
                    )
                
                Spacer()
                
                if !gameViewModel.isGameStarted {
                    ButtonView(action: {
                        isPaused = false
                        restartAnimation()
                        gameViewModel.startGame {
                            path.append(GamePath.finalScreen)
                        }
                    }, label: "Запустить", color: .gameViewButton)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 20)
                    
                } else {
                    ButtonView(
                        action: {
                            isPaused.toggle()
                            gameViewModel.togglePause {
                                path.append(GamePath.finalScreen)
                            }
                            if !isPaused {
                                restartAnimation() // Перезапуск анимации при продолжении
                            }
                        },
                        label: gameViewModel.isAnimating ? "Пауза" : "Продолжить",
                        color: gameViewModel.isAnimating ? .green : .gameViewButton
                    )
                    .padding(.horizontal, 20)
                    .padding(.bottom, 20)
                }
            }
            .navigationDestination(for: GamePath.self) { value in
                switch value {
                case .finalScreen:
                    FinalView(path: $path)
                }
            }
            .onAppear {
                animationAmount = minScale
                withAnimation(animation(duration)) {
                    animationAmount = maxScale
                }
                question = gameViewModel.randomQuestion()
                if !gameViewModel.isMute { gameViewModel.playMusic() }
            }
            .onChange(of: isPaused) { newValue in
                if !newValue { // если анимация не на паузе, запустить заново
                    restartAnimation()
                }
            }
            .onDisappear()
            .customToolbar(
                title: "Игра",
				backButtonAction: {
					gameViewModel.stopGame {
						path.removeLast()
					}
				},
                isShowingHint: true,
                hintAction: gameViewModel.musicMuteToggle,
                hintImage: gameViewModel.isMute ? "MusicOff" : "MusicOn"
            )
        }
    }
    
    private func restartAnimation() {
        
        gameViewModel.isAnimating = true
        let remainingTime = remainingDuration(animationAmount) // Сохраняем оставшееся время
        
        withAnimation(animation(remainingTime)) {
            animationAmount = (animationAmount == minScale) ? maxScale : minScale
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + remainingTime) {
            gameViewModel.isAnimating = false
            if !isPaused { // Только если не на паузе, продолжаем
                restartAnimation()
            }
        }
    }
    
}

extension GameView {
    enum GamePath {
        case finalScreen
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(path: .constant(NavigationPath()))
    }
}
