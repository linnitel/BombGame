//
//  Rules.swift
//  BombGame
//
//  Created by Julia Martcenko on 14/02/2025.
//

import Foundation
import SwiftUICore

struct RuleModel: Identifiable {
	let id: UUID = UUID()
	let text: LocalizedStringKey
	let number: String
	let isWithButton: Bool
	let buttonLabel: String?
}

struct Rules {
	static let rules: [RuleModel] = [
		RuleModel(text: "Все игроки становятся в круг.", number: "1", isWithButton: false, buttonLabel: nil),
		RuleModel(text: "Первый игрок берет телефон и нажимает кнопку:", number: "2", isWithButton: true, buttonLabel: "Старт игры"),
		RuleModel(text: "На экране появляется вопрос “Назовите Фрукт”.", number: "3", isWithButton: false, buttonLabel: nil),
		RuleModel(text: "Игрок отвечает на вопрос и после правильного ответа передает телефон следующему игроку.", number: "4", isWithButton: false, buttonLabel: nil),
		RuleModel(text: "Игроки по кругу отвечают на один и тот же вопрос до тех пор, пока не взорвется бомба.", number: "5", isWithButton: false, buttonLabel: nil),
		RuleModel(text: "Проигравшим считается тот, в чьих руках взорвалась бомба.", number: "6", isWithButton: false, buttonLabel: nil),
		RuleModel(text: LocalizedStringKey("Если выбран режим игры [“С Заданиями”](https), **то проигравший выполняет задание.**"), number: "7", isWithButton: false, buttonLabel: nil)
	]
}
