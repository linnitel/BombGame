//
//  CustomToolbar.swift
//  BombGame
//
//  Created by Julia Martcenko on 14/02/2025.
//

import SwiftUI

struct CustomToolBarContent: ToolbarContent {

	let title: String
	let backButtonAction: () -> Void
	let isShowingHint: Bool
	let hintAction: (() -> Void)?
	let hintImage: String?

	@Environment(\.presentationMode) var presentationMode

	var body: some ToolbarContent {
		ToolbarItem(placement: .topBarLeading) {
			Image(systemName: "chevron.left")
				.onTapGesture {
					backButtonAction()
				}
				.font(.system(.body, design: .rounded))
				.fontWeight(.bold)
				.foregroundColor(Color.appPrimary)
		}
		ToolbarItem(placement: .principal) {
			Text(title)
				.font(.system(.title, design: .rounded))
				.fontWeight(.bold)
				.foregroundColor(Color.appPrimary)
		}
		if isShowingHint {
			ToolbarItem(placement: .navigationBarTrailing) {
				Image(hintImage ?? "HelpIcon").onTapGesture {
					(hintAction ?? {})()
				}
				.padding(.trailing)
			}
		}
	}
}

struct CustomToolBarModifier: ViewModifier {

	let title: String
	let backButtonAction: () -> Void
	let isShowingHint: Bool
	let hintAction: (() -> Void)?
	let hintImage: String?

	func body(content: Content) -> some View {
		return content
			.toolbar {
				CustomToolBarContent(title: title, backButtonAction: backButtonAction, isShowingHint: isShowingHint, hintAction: hintAction, hintImage: hintImage)
			}
			.navigationBarBackButtonHidden(true)
	}
}

extension View {
	func customToolbar(title: String, backButtonAction: @escaping () -> Void, isShowingHint: Bool, hintAction: (() -> Void)?, hintImage: String? = nil) -> some View {
		return self.modifier(CustomToolBarModifier(title: title, backButtonAction: backButtonAction, isShowingHint: isShowingHint, hintAction: hintAction, hintImage: hintImage))
	}
}
