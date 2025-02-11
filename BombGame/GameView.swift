//
//  GameView.swift
//  BombGame
//
//  Created by Андрей Завадский on 11.02.2025.
//

import SwiftUI

struct GameView: View {
    @State private var isGameStarted = false
    
    var body: some View {
        VStack {
            Text("Игра")
                .font(.custom("SF Pro Rounded", size: 30, relativeTo: .title))
                .fontWeight(.bold)
                .padding(.top, 20)
            
            Spacer()
            
            Text(isGameStarted ? "Назовите вид зимнего спорта" : "Нажмите “Запустить”\nчтобы начать игру")
                .font(isGameStarted ? .custom("SF Pro Rounded", size: 28, relativeTo: .largeTitle) : .custom("SF Pro Rounded", size: 28, relativeTo: .headline))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 20)
            
            Spacer()
            
            Image("BombGameView")
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 400)
            
            Spacer()
            
            if !isGameStarted {
                Button(action: {
                    isGameStarted = true
                }) {
                    Text("Запустить")
                        .font(.custom("SF Pro Rounded", size: 20, relativeTo: .headline))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(.gameViewButton)
                        .cornerRadius(12)
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 20)
            }
        }
        .background(
            Image("background")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
        )
        
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
