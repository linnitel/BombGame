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
                    .foregroundStyle(.yellow) // Color! 3C3A3A
                Text(label)
                    .foregroundStyle(.gray) // Color! FFD25E
            }
            .frame(width: 330, height: 55)
            
        }
    }
}


#Preview {
    YellowButton(action: {}, label: "Другое задание")
}
