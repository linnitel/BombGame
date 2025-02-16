//
//  SettingsView.swift
//  BombGame
//
//  Created by Marat Fakhrizhanov on 14.02.2025.
//

import SwiftUI

struct SettingsView: View {
    
    @StateObject private var settingsVM = SettingsVM()
    @Binding var path: NavigationPath
    let player = AudioManager.shared
    
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
                            .offset(x: -87)
                        
                        TimeButtons(textOne: "Короткое", textTwo: "Среднее",
                                    funcOne: { settingsVM.setGameTime(time: 10)},
                                    funcTwo: { settingsVM.setGameTime(time: 20)})
                        
                        TimeButtons(textOne: "Длинное", textTwo: "Случайное",
                                    funcOne: { settingsVM.setGameTime(time: 45)},
                                    funcTwo: {
                            settingsVM.setGameTime(time: Int.random(in: 10...45))
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
                        MusicSetButtons(sound: $settingsVM.backgroundMusic,
                                        musicVariant: .background,
                                        title: MusicVariant.background.rawValue,
                                        sounds: settingsVM.backgroundSounds)

                        MusicSetButtons(sound: $settingsVM.bombSound, musicVariant: .bomb, title: MusicVariant.bomb.rawValue, sounds: settingsVM.bombSounds)
                        MusicSetButtons(sound: $settingsVM.explosionSound, musicVariant: .explosion, title: MusicVariant.explosion.rawValue, sounds: settingsVM.explosionSounds)
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
                        SupplementarySettings(setName: "Вибрация",value: $settingsVM.vibration)
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
        .navigationBarBackButtonHidden(true)
        .customToolbar(title: "Настройки",
                       backButtonAction: {
            player.stopAllSounds()
            path.removeLast()
        },
                       isShowingHint: false,
                       hintAction: nil)
//        .toolbar {
//            ToolbarItem(placement: .topBarLeading) {
//                Image(systemName: "chevron.left")
//                    .resizable()
//                    .frame(width: 20, height: 20)
//                    .onTapGesture {
//                        path.removeLast()
//                    }
//            }
//        }
    }
}

#Preview {
    SettingsView(path: .constant(NavigationPath()))
}
