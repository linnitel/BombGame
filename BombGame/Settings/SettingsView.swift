//
//  SettingsView.swift
//  BombGame
//
//  Created by Marat Fakhrizhanov on 14.02.2025.
//

import SwiftUI

struct SettingsView: View {
    
    @StateObject private var settingsVM = SettingsVM()
    
    var body: some View {
        
        ZStack {
            
            Group {
                Color.appSecondary
                Image(.topographicGray)
                    .resizable()
                    .frame(height: 900)
            }
            .ignoresSafeArea()
            
            VStack(spacing: 16) {
                
                // TIME
                ZStack(alignment: .topLeading) {
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundStyle(.categoryCellBg)
                    
                    VStack(spacing: 15) {
                        Text("ВРЕМЯ ИГРЫ")
                            .font(.system(size: 20, weight: .bold, design: .rounded))
                            .padding(.horizontal,18)
                            .padding(.top, 20)
                            .offset(x: -87) //hardcode
                        
                        TimeButtons(textOne: "Короткое", textTwo: "Среднее",
                                    funcOne: { settingsVM.setGameTime(time: 10)},
                                    funcTwo: { settingsVM.setGameTime(time: 30)})
                        
                        TimeButtons(textOne: "Длинное", textTwo: "Случайное",
                                    funcOne: { settingsVM.setGameTime(time: 60)},
                                    funcTwo: {
                            settingsVM.setGameTime(time: Int.random(in: 20...120))
                        })
                    }
                }
                .overlay {
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(style: .init(lineWidth: 1))
                }
                .frame(width: 342, height: 183)
                
                // MUSIC
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundStyle(.categoryCellBg)
                    
                    VStack(spacing: 15) {
                        MusicSetButtons(title: "Фоновая музыка", sound: $settingsVM.backgroundMusic, sounds: settingsVM.backgroundSounds)
                        MusicSetButtons(title: "Тиканье бамбы", sound: $settingsVM.bombSound, sounds: settingsVM.bombSounds)
                        MusicSetButtons(title: "Взрыв бомбы", sound: $settingsVM.explosionSound, sounds: settingsVM.explosionSounds)
                    }
                }
                .overlay {
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(style: .init(lineWidth: 1))
                }
                .frame(width: 342, height: 235)
                
                // SOME FUNC
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundStyle(.categoryCellBg)
                    
                    VStack(spacing: 15) {
                        SupplementarySettings(setName: "Вибрация", value: $settingsVM.vibration)
                        SupplementarySettings(setName: "Игра с заданиями", value: $settingsVM.gameForTasks)
                    }
                }
                .overlay {
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(style: .init(lineWidth: 1))
                }
                .frame(width: 342, height: 151)
            }
        }
        
    }
}

#Preview {
    SettingsView()
}
