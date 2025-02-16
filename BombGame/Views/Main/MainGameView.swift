//
//  MainGameView.swift
//  BombGame
//
//  Created by Julia Martcenko on 10/02/2025.
//

import SwiftUI

struct MainGameView: View {

	@State private var showRules: Bool = false
	@State private var path = NavigationPath()

    var body: some View {
		NavigationStack(path: $path) {
			VStack {
				ZStack {
					Group {
						Color.mainBackground
						Image("TopographicRootView")
							.resizable()
							.scaledToFill()
					}
					.ignoresSafeArea()
					VStack {
						Spacer()
						Text("ИГРА ДЛЯ КОМПАНИИ")
							.font(.system(size: 28, weight: .bold, design: .rounded))
							.foregroundColor(Color.appPrimary)
						Text("БОМБА")
                            .font(.system(size: 48, weight: .black, design: .rounded))
							.foregroundColor(Color.appPrimary)
						Image("BombRootView")
							.resizable()
							.scaledToFit()
							.frame(maxWidth: 300)

						Spacer()
						ButtonView(action: {
							path.append(Path.gameStart)
						}, label: "Старт игры", color: .mainViewButton)
						ButtonView(action: {
							path.append(Path.categorySelection)
						}, label: "Категории", color: .mainViewButton)
						.padding(.bottom, 20)
						Spacer()
					}
					.padding(.vertical, 40)
				}
			}

			.toolbar {
				ToolbarItem(placement: .navigationBarTrailing) {
					Image("RulesIcon").onTapGesture {
						showRules = true
					}
					.padding(.trailing)
				}
			}
			.sheet(isPresented: $showRules) {
				RulesView()
					.presentationDetents([.fraction(0.8)])
			}
			.navigationDestination(for: Path.self) { value in
				switch value {
					case .gameStart:
						GameView(path: $path)
					case .categorySelection:
						CategoryView(path: $path)
				}
			}
		}
   
    }
}

extension MainGameView {
	enum Path {
		case gameStart
		case categorySelection
	}
}

#Preview {
    MainGameView()
}
