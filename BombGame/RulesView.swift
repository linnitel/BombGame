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
				Text("Правила Игры")
					.fontWeight(.bold)
					.font(.system(size: 32))
				RuleItemView(label: "Все игроки становятся в круг.", number: "1")
				RuleItemView(label: "Первый игрок берет телефон и нажимает кнопку:", number: "2", isWithButton: true, buttonTitle: "Старт игры")
				RuleItemView(label: "На экране появляется вопрос “Назовите Фрукт”.", number: "3")
				RuleItemView(label: "Игрок отвечает на вопрос и после правильного ответа передает телефон следующему игроку.", number: "4")
				RuleItemView(label: "Игроки по кругу отвечают на один и тот же вопрос до тех пор, пока не взорвется бомба.", number: "5")
				RuleItemView(label: "Проигравшим считается тот, в чьих руках взорвалась бомба.", number: "6")
				RuleItemView(label: "Если выбран режим игры “С Заданиями”, то проигравший выполняет задание.", number: "7")
			}
			.frame(width: 290)
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
				Spacer()
				Text(label)
					.fontWeight(.medium)
					.font(.system(size: 18))
			}
			if isWithButton {
					ZStack {
						RoundedRectangle(cornerRadius: 5)
							.foregroundStyle(.mainViewButton)
							.shadow(radius: 5)
						Text(buttonTitle ?? "")
							.fontWeight(.bold)
							.foregroundStyle(Color.primary)
							.font(.system(size: 12))
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
