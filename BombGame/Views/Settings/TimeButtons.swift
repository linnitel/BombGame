//
//  TimeButttons.swift
//  BombGame
//
//  Created by Marat Fakhrizhanov on 14.02.2025.
//

import SwiftUI

struct TimeButtons: View {
    
    let textOne: String
    let textTwo: String
    
    let funcOne: () -> Void
    let funcTwo: () -> Void
    
    var body: some View {
        HStack(spacing: 20) {
            Button {
                if SettingsVM().vibration {
                    let impactHeavy = UIImpactFeedbackGenerator(style: .heavy)
                    impactHeavy.impactOccurred()
                    print("vibro time")
                }
                funcOne()
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundStyle(.appPrimary)
                        .frame(height: 40)
                    Text(textOne)
                        .font(.system(size: 16, weight: .bold, design: .rounded))
                        .foregroundStyle(.white)
                }
            }
            
            Button{
                if SettingsVM().vibration {
                    let impactHeavy = UIImpactFeedbackGenerator(style: .heavy)
                    impactHeavy.impactOccurred()
                    print("vibro time")
                }
                
                funcTwo()
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundStyle(.appPrimary)
                        .frame(height: 40)
                    Text(textTwo)
                        .font(.system(size: 16, weight: .bold, design: .rounded))
                        .foregroundStyle(.white)
                }
            }
        }
        .padding(.horizontal,20)
    }
}

#Preview {
    TimeButtons(textOne: "Коротkое", textTwo: "Среднее", funcOne: {}, funcTwo: {})
}
