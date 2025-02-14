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
                
                Text("Конец игры")
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .foregroundStyle(.appPrimary)
                    .padding(.top,50)
                
                Image(.finalExplosionView)
                    .resizable()
                    .frame(width: 249, height: 300)
                    .padding(.top, 65)
                
                Text( finalViewVM.currentTask )
                    .font(.system(size: 28, weight: .bold, design: .rounded))
                    .frame(width:329, height: 110)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.appPrimary)
                    .padding(.horizontal, 22)
                    .padding(.top,47)
                     
                VStack(spacing: 16) {
                    YellowButton(action: {finalViewVM.uploadTask()}, label: "Другое задание")
					YellowButton(action: {finalViewVM.newGame {
						path.removeLast()
					}}, label: "Начать заново")
                }
                .padding(.top,43)
                .padding(.bottom, 50)
            }
        }
        .onAppear(perform: finalViewVM.uploadTask)
		.navigationBarHidden(true)

    }
}

#Preview {
	FinalView(path: .constant(NavigationPath()))
}
