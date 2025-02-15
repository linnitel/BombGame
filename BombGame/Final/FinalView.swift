//
//  FinalView.swift
//  BombGame
//
//  Created by Marat Fakhrizhanov on 11.02.2025.
//

import SwiftUI

struct FinalView: View {
    @StateObject private var finalViewVM = FinalViewVM()
    @StateObject private var settingsVM = SettingsVM()
    
	@Binding var path: NavigationPath
    
    let explosionSound: String = UserDefaults.standard.string(forKey: "explosionSound") ?? "Взрыв2"
    
    var body: some View {
        ZStack {
            Group {
                Color.gameBackground
                Image(.topographicGray)
                    .resizable()
                    .frame(height: 910)
            }
            .ignoresSafeArea()
            
            VStack {
                Image(.finalExplosionView)
                    .resizable()
                    .frame(width: 249, height: 300)
                    .padding(.top, 65)
                
                //MARK: - Work with task
                if !settingsVM.gameForTasks { // !!!
                    
                    Text("Здесь может быть Ваше задание, с ним интереснее!")
                        .font(.system(size: 28, weight: .bold, design: .rounded))
                        .frame(width:329, height: 110)
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.appPrimary)
                        .padding(.horizontal, 22)
                        .padding(.top,47)
                    
                    VStack(spacing: 16) {
                        ButtonView(action: {settingsVM.gameForTasks = true}, label: "Открыть заданиe", color: .gameViewButton)
                        ButtonView(action: {finalViewVM.newGame {
                            path.removeLast()
                        }}, label: "Начать заново", color: .gameViewButton)
                    }
                    .padding(.top,43)
                    .padding(.bottom, 50)
                    
                } else {
                    Text( finalViewVM.currentTask )
                        .font(.system(size: 28, weight: .bold, design: .rounded))
                        .frame(width:329, height: 110)
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.appPrimary)
                        .padding(.horizontal, 22)
                        .padding(.top,47)
                    
                    VStack(spacing: 16) {
                        ButtonView(action: {finalViewVM.uploadTask()}, label: "Другое задание", color: .gameViewButton)
                        ButtonView(action: {finalViewVM.newGame {
                            path.removeLast()
                        }}, label: "Начать заново", color: .gameViewButton)
                    }
                    .padding(.top,43)
                    .padding(.bottom, 50)
                }
                // End mark
                
            }
        }
        .onAppear(perform: finalViewVM.uploadTask)
        .onAppear {
            if settingsVM.vibration {
                let impactHeavy = UIImpactFeedbackGenerator(style: .heavy)
                impactHeavy.impactOccurred()
            }
            AudioManager.shared.playSound(named: explosionSound, volume: 0.7, loops: 0)
		}
		.customToolbar(title: "Конец игры",
					   backButtonAction: {
			path.removeLast()
		},
					   isShowingHint: false,
					   hintAction: nil)

	}
}

#Preview {
	FinalView(path: .constant(NavigationPath()))
}
