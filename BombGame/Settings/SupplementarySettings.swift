//
//  SupplementarySettings.swift
//  BombGame
//
//  Created by Marat Fakhrizhanov on 14.02.2025.
//

import SwiftUI

struct SupplementarySettings: View {
    
    let setName: String
    @State var statusOnView = true
    
    @Binding var value: Bool
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .foregroundStyle(.appPrimary)
            
            HStack {
                Text(setName)
                        .foregroundStyle(.white)
                        .font(.system(size: 16, weight: .bold, design: .rounded))
                
                Spacer()
                
                Toggle( "", isOn: $statusOnView)
                    .frame(width: 50)
                    .onChange(of: statusOnView) { oldValue, newValue in
                        value = newValue
                    }
            }
            .padding(.horizontal,20)
        }
        .frame(width: 308, height: 49)
        .padding(.horizontal,15)
        
    }
}

#Preview {
    SupplementarySettings(setName: "Vibration", value: .constant(true))
}
