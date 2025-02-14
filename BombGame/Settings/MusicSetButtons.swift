//
//  MusicSetButtons.swift
//  BombGame
//
//  Created by Marat Fakhrizhanov on 14.02.2025.
//

import SwiftUI

struct MusicSetButtons: View {
    
    let title: String

    @Binding var sound: String
    let sounds: [String]
    
    var body: some View {
      
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .foregroundStyle(.appPrimary)
            
            HStack {
                Text(title)
                        .foregroundStyle(.white)
                        .font(.system(size: 16, weight: .bold, design: .rounded))
                    
                Spacer()
                
                Picker("music", selection: $sound) {
                    ForEach(sounds, id:\.self) { sound in
                        Text(sound)
                            .font(.system(size: 16, weight: .bold, design: .rounded))
                            .foregroundStyle(.white)
                            .opacity(0.5)
                    }
                }
                .frame(width: 110)
                .pickerStyle(.wheel)
                
            }
            .padding(.horizontal, 20)
        }
        .frame(width: 308, height: 49)
    }
}

#Preview {
    MusicSetButtons(title: "Фоновая музыка", sound: .constant("Мел 1"), sounds: ["Мелодия 1", "Мелодия 2", "Мелодия 3"])
}
