//
//  YellowButton.swift
//  BombGame
//
//  Created by Marat Fakhrizhanov on 11.02.2025.
//

import SwiftUI

struct YellowButton: View {
    
    let action: () -> Void
    let label: String
    
    var body: some View {
        Button(action: action) {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(.gameViewButton)
                Text(label)
                    .font(.custom("SF Pro Display", size: 20))
                    .foregroundStyle(.appPrimary)
            }
            .frame(width: 330, height: 55)
            
        }
    }
}


#Preview {
    YellowButton(action: {}, label: "Другое задание")
}
