//
//  MusicSetButtons.swift
//  BombGame
//
//  Created by Marat Fakhrizhanov on 14.02.2025.
//

import SwiftUI

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
                
                Menu {
                    ForEach(sounds, id: \.self) { sound in
                        Button(action: {
                            self.sound = sound
                            handleSoundChange(newValue: sound)
                        }) {
                            Text(sound)
                                .font(.system(size: 16, weight: .bold, design: .rounded))
                                .foregroundStyle(.white)
                        }
                    }
                } label: {
                    Text(sound)
                        .font(.system(size: 16, weight: .bold, design: .rounded))
                        .foregroundStyle(.white)
                }
            }
            .padding(.horizontal, 20)
        }
        .frame(height: 49)
        .padding(.horizontal, 20)
    }
    
    private func handleSoundChange(newValue: String) {
        if SettingsVM().vibration {
            let impactHeavy = UIImpactFeedbackGenerator(style: .heavy)
            impactHeavy.impactOccurred()
            print("vibro music")
        }
        
        player.stopAllSounds()
        player.playSound(named: newValue, volume: 0.5, loops: 1)
        
        switch musicVariant {
        case .background:
            settingsVM.setBackgroundMusic(music: newValue)
        case .bomb:
            settingsVM.setBombSound(sound: newValue)
        case .explosion:
            settingsVM.setExplosionSound(sound: newValue)
        }
    }
}

//#Preview {
//    MusicSetButtons(title: "Фоновая музыка", sound: .constant("Мел 1"), sounds: ["Мелодия 1", "Мелодия 2", "Мелодия 3"])
//}
