//
//  CategoryCellView.swift
//  BombGame
//
//  Created by Gerodot on 15.02.2025.
//


import SwiftUI

struct CategoryCellView: View {
    var image: String
    var name: String
    var isHint: Bool = false
    @Binding var isSelected: Bool

    var body: some View {
        ZStack {
            VStack {
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(minHeight: 60)
                    .clipped()
                    .padding(.horizontal, 30)
                    .padding(.top, 20)
                Text(name)
                    .font(.system(.body, design: .rounded))
                    .fontWeight(.bold)
                    .foregroundColor(Color.appPrimary)
            }
            .padding(.vertical, 20)

            // если оберуть в if isSelected {} то можно скрыть чекбокс
            VStack {
                HStack {
                    Image(systemName: isSelected ? "checkmark.circle.fill" : "circle")
                        .resizable()
                        .fontWeight(.bold)
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                        .foregroundColor(Color.appPrimary)
                        .padding()
                    Spacer()
                }
                Spacer()
            }

        }
        .background(!isSelected || isHint ?  .categoryCellBg : .selectedCategorySetBg  )
        .clipShape(
            RoundedRectangle(cornerRadius: 20)
        )
        .shadow(color: .black.opacity(0.5), radius: 4, x: 0, y: 6)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(.black, lineWidth: 1)
        )
    }
}

#Preview {
    NavigationStack{
        CategoryView(path: .constant(NavigationPath()))
    }
}
