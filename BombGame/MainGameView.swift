//
//  MainGameView.swift
//  BombGame
//
//  Created by Julia Martcenko on 10/02/2025.
//

import SwiftUI

struct MainGameView: View {

	@State private var showRules: Bool = false

    var body: some View {
		NavigationStack {
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
						Text("БОМБА")
							.font(.system(size: 48, weight: .bold, design: .rounded))
						Image("BombRootView")
							.resizable()
							.scaledToFit()
							.frame(width: 300, height: 300)
						Spacer()
						ButtonView(action: {}, label: "Старт игры")
						ButtonView(action: {}, label: "Категории")
						Spacer()
					}
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
		}

    }
}

struct ButtonView: View {
	let action: () -> Void
	let label: String

	var body: some View {
			Button(action: action) {
				ZStack {
					RoundedRectangle(cornerRadius: 10)
						.foregroundStyle(.mainViewButton)
						.shadow(radius: 5)
					Text(label)
						.font(.system(size: 20, weight: .semibold, design: .rounded))
						.foregroundStyle(Color.primary)
				}
				.frame(width: 330, height: 55)
			}

	}
}

#Preview {
    MainGameView()
}
