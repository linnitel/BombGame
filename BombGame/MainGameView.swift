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
					Color.mainBackground
					Image("TopographicRootView")
						.resizable()
						.scaledToFit()
					VStack {
						Spacer()
						Text("ИГРА ДЛЯ КОМПАНИИ")
							.fontWeight(.bold)
							.font(.system(size: 28))
						Text("БОМБА")
							.fontWeight(.bold)
							.font(.system(size: 48))
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
			.ignoresSafeArea()
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
						.fontWeight(.bold)
						.foregroundStyle(Color.primary)
				}
				.frame(width: 330, height: 55)
			}

	}
}

#Preview {
    MainGameView()
}
