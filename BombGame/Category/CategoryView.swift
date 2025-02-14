//
//  CategoryView.swift
//  BombGame
//
//  Created by Gerodot on 13.02.2025.
//

import SwiftUI



// Model:
struct CategoryModel: Hashable, Identifiable {
    let id: UUID
    let name: String
    let category: Category
    let image: String
    var isSelected: Bool

    static var all: [CategoryModel] = [
        CategoryModel(id: UUID(), name: "О разном", category: .general, image: "RandomCategory", isSelected: false),
        CategoryModel(id: UUID(), name: "Знаменитости", category: .celebrities, image: "CelebritiesCategory", isSelected: false),
        CategoryModel(id: UUID(), name: "Про жизнь", category: .life, image: "LifeCategory", isSelected: false),
        CategoryModel(id: UUID(), name: "Спорт", category: .sport, image: "SportCategory", isSelected: false),
        CategoryModel(id: UUID(), name: "Искусство и Кино", category: .moviesAndArt, image: "ArtCategory", isSelected: false),
        CategoryModel(id: UUID(), name: "Природа", category: .nature, image: "NatureCategory", isSelected: false),
    ]
}

// ViewModel
class CategoryViewModel: ObservableObject {
    @Published var categories = CategoryModel.all
    @Published var questions: [Question] = []

    // Собираем категории и фильтруем вопросы
    func addQuestionsToGame() {
        let selectedCategories = categories.filter { $0.isSelected }.map { $0.category }
        questions = Question.questions.filter { selectedCategories.contains($0.category) }
    }
}

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
                        CategoryCellView(image: category.image, name: category.name, isSelected: $category.isSelected)
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
                ButtonView(action: {
					path.append(CategoryPath.gameScreen)
				}, label: "Начать игру", color: .mainViewButton)
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Image(systemName: "chevron.left")
					.onTapGesture {
						path.removeLast()
					}
                    .font(.system(.body, design: .rounded))
                    .fontWeight(.bold)
                    .foregroundColor(Color.appPrimary)
            }
            ToolbarItem(placement: .principal) {
                Text("Категории")
                    .font(.system(.title, design: .rounded))
                    .fontWeight(.bold)
                    .foregroundColor(Color.appPrimary)
               }
            ToolbarItem(placement: .navigationBarTrailing) {
                Image("HelpIcon").onTapGesture {
                    showHint = true
                }
                .padding(.trailing)
            }
        }
		.navigationBarBackButtonHidden(true)
		.navigationDestination(for: CategoryPath.self) { value in
			switch value {
				case .gameScreen:
					GameView(path: $path)
			}
		}
        .sheet(isPresented: $showHint) {
            HintView()
                .presentationDetents([.fraction(0.8)])
        }
        .navigationBarTitleDisplayMode(.inline)

    }
}

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
                    .frame(minHeight: 120)
                    .clipped()
                    .padding(.horizontal, 30)
                    .padding(.top, 30)
                Text(name)
                    .font(.system(.body, design: .rounded))
                    .fontWeight(.bold)
                    .foregroundColor(Color.appPrimary)
                    .padding(.top)
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
        .background(!isSelected ?  Color.categoryCellBg : Color.selectedCategorySetBg )
        .clipShape(
            RoundedRectangle(cornerRadius: 20)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.black, lineWidth: 3)
        )
    }
}

struct HintView: View {
    let isHint = false
    let categories = CategoryModel.all
    @State var isSelected = true
    
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
                Group {
                    Text("Правила Игры")
                        .font(.system(.largeTitle, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(Color.appPrimary)
                    
                    Text("В игре доступно 6 категорий и более 90 вопросов.")
                        .font(.system(.largeTitle, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(Color.appPrimary)

                    
                    Text("Можно выбрать сразу несколько категорий для игры.")
                        .font(.system(.largeTitle, design: .rounded))
                        .fontWeight(.light)
                        .foregroundColor(Color.appPrimary)
                }

                
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
