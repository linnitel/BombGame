//
//  CategoryHintView.swift
//  BombGame
//
//  Created by Gerodot on 15.02.2025.
//


import SwiftUI

struct CategoryHintView: View {
    let isHint = true
    let categories = CategoryModel.all
    @State var isSelected = true
    
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 20),
        GridItem(.flexible(), spacing: 20)
    ]
    
    var body: some View {
        
        ZStack{
            Group {
                Color.mainBackground
                Image(.topographicGray)
                    .resizable()
                    .clipped()
            }
            .ignoresSafeArea()
            
            ScrollView{
                VStack(alignment: .center) {

                    RoundedRectangle(cornerRadius: 15)
                        .frame(width: 68, height: 3)
                    
                    Text("Правила Игры")
                        .font(.system(.largeTitle, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(Color.appPrimary)
                        .multilineTextAlignment(.center)
                    

                    Text("В игре доступно 6 категорий и более 90 вопросов.")
                        .font(.system(.title, design: .rounded))
                        .fontWeight(.black)
                        .foregroundColor(Color.appPrimary)
                        .multilineTextAlignment(.center)
                        .padding()
                    
                    Text("Можно выбрать сразу несколько категорий для игры.")
                        .font(.system(.title, design: .rounded))
                        .fontWeight(.light)
                        .foregroundColor(Color.appPrimary)
                        .multilineTextAlignment(.center)
                    
             
                }
                .padding(20)

                
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(categories) { category in
                        CategoryCellView(image: category.image, name: category.name, isHint: isHint, isSelected: $isSelected)
                    }
                    
                }
                .padding(20)
            }
        }
        .navigationTitle("Правила игры")
    }
}

#Preview {
    CategoryHintView()
}
