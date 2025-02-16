//
//  FinalView.swift
//  BombGame
//
//  Created by Marat Fakhrizhanov on 11.02.2025.
//

import SwiftUI

struct FinalView: View {
    @StateObject private var finalViewVM = FinalViewVM()

	@Binding var path: NavigationPath

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
                    .scaledToFit()
                    .frame(maxWidth: 249)
                    .padding()
                
                if SettingsManager.shared.tasks {
                    Text( finalViewVM.currentTask?.title ?? "Пропускаешь одну игру - у разраба nil :)" )
                        .font(.system(size: 28, weight: .bold, design: .rounded))
                        .frame(width:329, height: 110)
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.appPrimary)
                        .padding(.bottom)
                }
                     
                VStack(spacing: 16) {
                    
                    if SettingsManager.shared.tasks {
                        ButtonView(
                            action: { finalViewVM.uploadTask() },
                            label: "Другое задание",
                            color: .gameViewButton)
                    }
                    
                    ButtonView(
                        action: { finalViewVM.newGame { path.removeLast() } },
                        label: "Начать заново",
                        color: .gameViewButton
                    )
                }
            }
        }
        .onAppear(perform: finalViewVM.uploadTask)
        .onAppear {
            finalViewVM.boom()
		}
		.customToolbar(
            title: "Конец игры",
			backButtonAction: { path.removeLast() },
            isShowingHint: false,
            hintAction: nil
        )

	}
}

#Preview {
	FinalView(path: .constant(NavigationPath()))
}
