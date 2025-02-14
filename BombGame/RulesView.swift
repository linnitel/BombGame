//
//  RulesView.swift
//  BombGame
//
//  Created by Julia Martcenko on 11/02/2025.
//

import SwiftUI

struct RulesView: View {
    var body: some View {
		ZStack {
			Group {
				Color.mainSheetBg
				Image("TopographicYellow")
					.resizable()
					.scaledToFill()
			}
			.ignoresSafeArea()
				VStack {
					RoundedRectangle(cornerRadius: 15)
						.frame(width: 68, height: 3)
					Text("Правила Игры")
						.font(.system(size: 32, weight: .bold, design: .rounded))
					VStack(alignment: .leading) {
						ForEach(Rules.rules) { rule in
							RuleItemView(label: rule.text, number: rule.number, isWithButton: rule.isWithButton, buttonTitle: rule.buttonLabel)
						}
					}
				}
				.frame(width: 320)
				.multilineTextAlignment(.leading)
				.lineLimit(nil)
		}

    }
}

struct RuleItemView: View {
	let label : String
	let number: String
	var isWithButton: Bool = false
	var buttonTitle: String? = nil

	var body: some View {
		VStack {
			HStack {
				CircleView(number: number)
					.frame(width: 29, height: 29)
					.shadow(radius: 4, x: 0, y: 4)
				Text(label)
					.font(.system(size: 18, weight: .medium, design: .rounded))
			}
			if isWithButton {
					ZStack {
						RoundedRectangle(cornerRadius: 5)
							.foregroundStyle(.mainViewButton)
							.shadow(radius: 5)
						Text(buttonTitle ?? "")
							.foregroundStyle(Color.primary)
							.font(.system(size: 12, weight: .bold, design: .rounded))
					}
					.frame(width: 167, height: 28)
			}
		}
	}
}

struct CircleView: View {
	let number: String
	
	var body: some View {
		ZStack {
			Circle()
				.fill(Color.mainBackground)
			Text(number)
				.fontWeight(.bold)
				.font(.system(size: 16))
		}
	}
}

#Preview {
    RulesView()
}
