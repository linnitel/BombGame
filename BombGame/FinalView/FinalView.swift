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
            
             // фон
            
            VStack {
                
                Text("Конец игры")
                    .font(.system(size: 30)) // Font
                    .padding(.top,50)
                
                Image("finalImage") // texture
                    .resizable()
                    .frame(width: 249, height: 300)
                    .padding(.top, 65)
                
                Text( finalViewVM.currentTask )
                    .frame(width:329, height: 110) // height != figma :)
                    .font(.system(size: 27))
                    .multilineTextAlignment(.center)
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
