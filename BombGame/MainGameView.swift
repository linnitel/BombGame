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
							.font(.system(size: 48, weight: .bold, design: .rounded))
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
                ToolbarItem(placement: .topBarLeading) {
                    Image(systemName: "gearshape.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .onTapGesture {
                            // go to settings
                            path.append(Path.settings)
                            
                        }
                        .padding(.leading, 15)
                    
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
                    case .settings:
                    SettingsView(path: $path)
                }
			}
		}
   
    }
}

//struct ButtonView: View {
//	let action: () -> Void
//	let label: String
//
//	var body: some View {
//			Button(action: action) {
//				ZStack {
//					RoundedRectangle(cornerRadius: 10)
//						.foregroundStyle(.mainViewButton)
//						.shadow(radius: 5)
//					Text(label)
//						.font(.system(size: 20, weight: .semibold, design: .rounded))
//						.foregroundColor(Color.appPrimary)
//				}
//				.frame(height: 55)
//				.padding(.horizontal, 20)
//			}
//
//	}
//}

extension MainGameView {
	enum Path {
		case gameStart
		case categorySelection
        case settings
	}
}

#Preview {
    MainGameView()
}
