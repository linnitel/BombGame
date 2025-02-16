//
//  MusicSetButtons.swift
//  BombGame
//
//  Created by Marat Fakhrizhanov on 14.02.2025.
//

import SwiftUI

struct MusicSetButtons: View {

    let player = AudioManager.shared
    @StateObject var settingsVM = SettingsVM()
    @Binding var sound: String
    
    let musicVariant: MusicVariant
    let title: String
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
                .onChange(of: sound) { newValue in
                    
                    if SettingsVM().vibration {
                        let impactHeavy = UIImpactFeedbackGenerator(style: .heavy)
                            impactHeavy.impactOccurred()
                        print("vibro music")
                    }
                    
                    player.stopAllSounds()
                    player.playSound(named: sound, volume: 0.5, loops: 1)
                    
                    switch musicVariant {
                    case .background:
                        settingsVM.setBackgroundMusic(music: sound)
                    case .bomb:
                        settingsVM.setBombSound(sound: sound)
                    case .explosion:
                        settingsVM.setExplosionSound(sound: sound)
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

//#Preview {
//    MusicSetButtons(title: "Фоновая музыка", sound: .constant("Мел 1"), sounds: ["Мелодия 1", "Мелодия 2", "Мелодия 3"])
//}
