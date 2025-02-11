//
//  FinalView.swift
//  BombGame
//
//  Created by Marat Fakhrizhanov on 11.02.2025.
//

import SwiftUI

struct FinalView: View {
    @StateObject private var finalViewVM = FinalViewVM()
    
    var body: some View {
        ZStack {
            Color.gameBackground
            Image(.topographicGray)
                .resizable()
                .frame(height: 900)
            
            VStack {
                
                Text("Конец игры")
                    .font(.custom("SF Pro Rounded", size: 30))
                    .foregroundStyle(.appPrimary)
                    .padding(.top,50)
                
                Image("finalImage")
                    .resizable()
                    .frame(width: 249, height: 300)
                    .opacity(0.85) //? texture under image
                    .padding(.top, 65)
                
                Text( finalViewVM.currentTask )
                    .frame(width:329, height: 110)
                    .font(.system(size: 28))
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.appPrimary)
                    .padding(.horizontal, 22)
                    .padding(.top,47)
                     
                VStack(spacing: 16) {
                    YellowButton(action: {finalViewVM.uploadTask()}, label: "Другое задание")
                    YellowButton(action: {finalViewVM.newGame()}, label: "Начать заново")
                }
                .padding(.top,43)
                .padding(.bottom, 50)
            }
        }
        .onAppear( perform: finalViewVM.uploadTask ) 
        .ignoresSafeArea()
    }
}

#Preview {
    FinalView()
}
