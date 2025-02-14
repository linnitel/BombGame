//
//  GameView.swift
//  BombGame
//
//  Created by Андрей Завадский on 11.02.2025.
//

import SwiftUI

struct GameView: View {
    @StateObject private var gameViewModel = GameViewModel()

	@Binding var path: NavigationPath

    var body: some View {
        ZStack {
            Group {
                Color.gameBackground
                Image(.topographicGray)
                    .resizable()
            }
            .ignoresSafeArea()
            
            VStack {
                
                Spacer()
                
                Text(gameViewModel.isGameStarted ? "Назовите вид зимнего спорта" : "Нажмите “Запустить”\nчтобы начать игру")
                    .font(gameViewModel.isGameStarted ? .system(size: 28, weight: .bold, design: .rounded) : .system(size: 28, weight: .regular, design: .rounded))
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
                    .scaleEffect(gameViewModel.animationAmount)
                    .animation(gameViewModel.isAnimating ?
                        .easeInOut(duration: 1)
                        .repeatForever(autoreverses: true) : .none,
                               value: gameViewModel.animationAmount
                    )
                
                Spacer()
                
                if !gameViewModel.isGameStarted {
                    Button(action: {
						gameViewModel.startGame {
							path.append(GamePath.finalScreen)
						}
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
						gameViewModel.togglePause {
							path.append(GamePath.finalScreen)
						}

                    }) {
                        Text(gameViewModel.isAnimating ? "Пауза" : "Продолжить")
                            .font(.system(size: 20, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(gameViewModel.isAnimating ? .green : .gameViewButton)
                            .cornerRadius(12)
                    }
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
                gameViewModel.playBackgroundMusic()
            }
			.toolbar {
				ToolbarItem(placement: .topBarLeading) {
					Image(systemName: "chevron.left")
						.onTapGesture {
							path.removeLast()
						}
						.font(.system(.body, design: .rounded))
						.fontWeight(.bold)
						.foregroundColor(Color.appPrimary)
				}
				ToolbarItem(placement: .principal) {
					Text("Игра")
						.font(.system(.title, design: .rounded))
						.fontWeight(.bold)
						.foregroundColor(Color.appPrimary)
				}
			}
			.navigationBarBackButtonHidden(true)
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
