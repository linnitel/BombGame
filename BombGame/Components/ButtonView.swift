//
//  ButtonView.swift
//  BombGame
//
//  Created by Marat Fakhrizhanov on 11.02.2025.
//

import SwiftUI

struct ButtonView: View {
    
    let action: () -> Void
    let label: String
	let color: Color

    var body: some View {
        Button(action: action) {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
					.foregroundStyle(color)
                    .shadow(color: .black.opacity(0.5), radius: 4, x: 0, y: 6)
                Text(label)
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                    .foregroundStyle(.appPrimary)
            }
			.frame(height: 55)
			.padding(.horizontal, 20)
        }
    }
}


#Preview {
	ButtonView(action: {}, label: "Другое задание", color: Color.gameBackground)
}
