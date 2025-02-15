//
//  CategoryView.swift
//  BombGame
//
//  Created by Gerodot on 13.02.2025.
//

import SwiftUI

struct CategoryView: View {
    
    @StateObject private var viewModel = CategoryViewModel()
    @State private var showHint = false

    @Binding var path: NavigationPath

    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 20),
        GridItem(.flexible(), spacing: 20)
    ]

    var body: some View {
        ZStack{
            Group {
                Color.gameBackground
                Image(.topographicGray)
                    .resizable()
            }
            .ignoresSafeArea()

            ScrollView{
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach($viewModel.categories) { $category in
                        CategoryCellView(
                            image: category.image,
                            name: category.name,
                            isSelected: $category.isSelected
                        )
                        .onTapGesture {
                            category.isSelected.toggle()
                            viewModel.addQuestionsToGame()
                        }
                    }
                   
                }
                .padding(20)
                .padding(.bottom, 60)
            }
            
            VStack {
                Spacer()
                ButtonView(
                    action: { path.append(CategoryPath.gameScreen) },
                    label: "Начать игру",
                    color: .gameViewButton
                )
                .padding(.bottom)
            }
        }
        .customToolbar(
            title: "Категории",
            backButtonAction: { path.removeLast() },
            isShowingHint: true,
            hintAction: { showHint = true },
            hintImage: ("HelpIcon")
        )
        .navigationDestination(for: CategoryPath.self) { value in
            switch value {
                case .gameScreen:
                    GameView(path: $path)
            }
        }
        .sheet(isPresented: $showHint) {
            CategoryHintView()
                .presentationDetents([.large])
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

extension CategoryView {
    enum CategoryPath {
        case gameScreen
    }
}

#Preview {
    NavigationStack{
        CategoryView(path: .constant(NavigationPath()))
    }
}
