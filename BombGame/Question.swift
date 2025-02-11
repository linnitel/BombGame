//
//  File.swift
//  BombGame
//
//  Created by Marat Fakhrizhanov on 11.02.2025.
//

import Foundation

enum Category {
    case general
    case sport
    case life
    case celebrities
    case moviesAndArt
    case nature
}

struct Question {
    let question: String
    let category: Category
    
    static let questions: [Question] = [
        
        //General
        Question(question: "Какие страны вы хотели бы посетить?", category: .general),
        Question(question: "Какие книги вам нравятся?", category: .general),
        Question(question: "Какие животные живут в джунглях?", category: .general),
        Question(question: "Какие фрукты вы любите?", category: .general),
        Question(question: "Какие фильмы можно пересматривать снова и снова?", category: .general),
        Question(question: "Какие музыкальные жанры вам известны?", category: .general),
        Question(question: "Какие качества важны в друге?", category: .general),
        Question(question: "Какие праздники отмечают в разных странах?", category: .general),
        Question(question: "Какие известные изобретения изменили мир?", category: .general),
        Question(question: "Какие языки вы хотели бы выучить?", category: .general),
        // Sport
        Question(question: "Какие виды единоборств вы знаете?", category: .sport),
        Question(question: "Какие знаменитые футболисты вам известны?", category: .sport),
        Question(question: "Какие спортивные игры можно играть с мячом?", category: .sport),
        Question(question: "Какие Олимпийские виды спорта вы можете назвать?", category: .sport),
        Question(question: "Какие упражнения помогают развить выносливость?", category: .sport),
        Question(question: "Какие зимние виды спорта вам известны?", category: .sport),
        Question(question: "Какие страны сильны в футболе?", category: .sport),
        Question(question: "Какие спортивные инвентари нужны для тенниса?", category: .sport),
        Question(question: "Какие виды лёгкой атлетики вы знаете?", category: .sport),
        //Life
        Question(question: "Какие моменты в жизни делают вас счастливыми?", category: .life),
        Question(question: "Какие ценности для вас важны?", category: .life),
        Question(question: "Какие жизненные уроки вы усвоили?", category: .life),
        Question(question: "Какие мечты у вас есть?", category: .life),
        Question(question: "Какие качества помогают добиваться успеха?", category: .life),
        Question(question: "Какие вещи делают жизнь интереснее?", category: .life),
        Question(question: "Какие традиции есть в вашей семье?", category: .life),
        Question(question: "Какие привычки помогают быть здоровым?", category: .life),
        Question(question: "Какие события изменили вашу жизнь?", category: .life),
        Question(question: "Какие цели вы хотите достичь?", category: .life),
        //Celebrities
        Question(question: "Какие актёры вам нравятся?", category: .celebrities),
        Question(question: "Какие известные спортсмены вам известны?", category: .celebrities),
        Question(question: "Какие певцы популярны в мире?", category: .celebrities),
        Question(question: "Какие режиссёры сняли культовые фильмы?", category: .celebrities),
        Question(question: "Какие блогеры вам интересны?", category: .celebrities),
        Question(question: "Какие звёзды выиграли “Оскар”?", category: .celebrities),
        Question(question: "Какие знаменитости известны своим стилем?", category: .celebrities),
        Question(question: "Какие художники оставили след в истории?", category: .celebrities),
        Question(question: "Какие политики стали известны во всём мире?", category: .celebrities),
        Question(question: "Какие знаменитости занимаются благотворительностью?", category: .celebrities),
        //Movies and Art
        Question(question: "Какие фильмы вам нравятся?", category: .moviesAndArt),
        Question(question: "Какие жанры кино вы предпочитаете?", category: .moviesAndArt),
        Question(question: "Какие фильмы стали культовыми?", category: .moviesAndArt),
        Question(question: "Какие экранизации книг вам понравились?", category: .moviesAndArt),
        Question(question: "Какие мультфильмы можно смотреть в любом возрасте?", category: .moviesAndArt),
        Question(question: "Какие фильмы вас вдохновляют?", category: .moviesAndArt),
        Question(question: "Какие кинозлодеи самые запоминающиеся?", category: .moviesAndArt),
        Question(question: "Какие режиссёры создали великие фильмы?", category: .moviesAndArt),
        Question(question: "Какие фильмы стоит посмотреть хотя бы раз в жизни?", category: .moviesAndArt),

        Question(question: "Какие художники вам нравятся?", category: .moviesAndArt),
        Question(question: "Какие направления в искусстве вам интересны?", category: .moviesAndArt),
        Question(question: "Какие картины вам запомнились?", category: .moviesAndArt),
        Question(question: "Какие музеи стоит посетить?", category: .moviesAndArt),
        Question(question: "Какие скульптуры произвели на вас впечатление?", category: .moviesAndArt),
        Question(question: "Какие произведения искусства изменили историю?", category: .moviesAndArt),
        Question(question: "Какие виды искусства вам ближе всего?", category: .moviesAndArt),
        Question(question: "Какие современные художники вам известны?", category: .moviesAndArt),
        Question(question: "Какие архитектурные здания вдохновляют вас?", category: .moviesAndArt),
        Question(question: "Какие искусства развиваются в последние десятилетия?", category: .moviesAndArt),
        //Nature
        Question(question: "Какие растения вам нравятся?", category: .nature),
        Question(question: "Какие природные явления вас поражают?", category: .nature),
        Question(question: "Какие леса или горы вы бы хотели посетить?", category: .nature),
        Question(question: "Какие реки или озёра вам известны?", category: .nature),
        Question(question: "Какие экосистемы вам наиболее впечатляют?", category: .nature),
        Question(question: "Какие природные ресурсы считаются важными для человечества?", category: .nature),
        Question(question: "Какие национальные парки стоит посетить?", category: .nature),
        Question(question: "Какие виды растений можно встретить дома?", category: .nature),
        Question(question: "Какие виды растений можно встретить в вашем регионе?", category: .nature),
        Question(question: "Какие изменения в природе вы замечаете в последнее время?", category: .nature),
        
    ]
    
}
//
////General
//Question(question: "Какие страны вы хотели бы посетить?", category: .geneal)
//Question(question: "Какие книги вам нравятся?", category: .geneal)
//Question(question: "Какие животные живут в джунглях?", category: .general)
//Question(question: "Какие фрукты вы любите?", category: .general)
//Question(question: "Какие фильмы можно пересматривать снова и снова?", category: .general)
//Question(question: "Какие музыкальные жанры вам известны?", category: .general)
//Question(question: "Какие качества важны в друге?", category: .general)
//Question(question: "Какие праздники отмечают в разных странах?", category: .general)
//Question(question: "Какие известные изобретения изменили мир?", category: .general)
//Question(question: "Какие языки вы хотели бы выучить?", category: .general)
//// Sport
//Question(question: "Какие виды единоборств вы знаете?", category: .sport)
//Question(question: "Какие знаменитые футболисты вам известны?", category: .sport)
//Question(question: "Какие спортивные игры можно играть с мячом?", category: .sport)
//Question(question: "Какие Олимпийские виды спорта вы можете назвать?", category: .sport)
//Question(question: "Какие упражнения помогают развить выносливость?", category: .sport)
//Question(question: "Какие зимние виды спорта вам известны?", category: .sport)
//Question(question: "Какие страны сильны в футболе?", category: .sport)
//Question(question: "Какие спортивные инвентари нужны для тенниса?", category: .sport)
//Question(question: "Какие виды лёгкой атлетики вы знаете?", category: .sport)
////Life
//Question(question: "Какие моменты в жизни делают вас счастливыми?", category: .life)
//Question(question: "Какие ценности для вас важны?", category: .life)
//Question(question: "Какие жизненные уроки вы усвоили?", category: .life)
//Question(question: "Какие мечты у вас есть?", category: .life)
//Question(question: "Какие качества помогают добиваться успеха?", category: .life)
//Question(question: "Какие вещи делают жизнь интереснее?", category: .life)
//Question(question: "Какие традиции есть в вашей семье?", category: .life)
//Question(question: "Какие привычки помогают быть здоровым?", category: .life)
//Question(question: "Какие события изменили вашу жизнь?", category: .life)
//Question(question: "Какие цели вы хотите достичь?", category: .life)
////Celebrities
//Question(question: "Какие актёры вам нравятся?", category: .celebrities)
//Question(question: "Какие известные спортсмены вам известны?", category: .celebrities)
//Question(question: "Какие певцы популярны в мире?", category: .celebrities)
//Question(question: "Какие режиссёры сняли культовые фильмы?", category: .celebrities)
//Question(question: "Какие блогеры вам интересны?", category: .celebrities)
//Question(question: "Какие звёзды выиграли “Оскар”?", category: .celebrities)
//Question(question: "Какие знаменитости известны своим стилем?", category: .celebrities)
//Question(question: "Какие художники оставили след в истории?", category: .celebrities)
//Question(question: "Какие политики стали известны во всём мире?", category: .celebrities)
//Question(question: "Какие знаменитости занимаются благотворительностью?", category: .celebrities)
////Movies and Art
//Question(question: "Какие фильмы вам нравятся?", category: .moviesAndArt)
//Question(question: "Какие жанры кино вы предпочитаете?", category: .moviesAndArt)
//Question(question: "Какие фильмы стали культовыми?", category: .moviesAndArt)
//Question(question: "Какие экранизации книг вам понравились?", category: .moviesAndArt)
//Question(question: "Какие мультфильмы можно смотреть в любом возрасте?", category: .moviesAndArt)
//Question(question: "Какие фильмы вас вдохновляют?", category: .moviesAndArt)
//Question(question: "Какие кинозлодеи самые запоминающиеся?", category: .moviesAndArt)
//Question(question: "Какие режиссёры создали великие фильмы?", category: .moviesAndArt)
//Question(question: "Какие фильмы стоит посмотреть хотя бы раз в жизни?", category: .moviesAndArt)
//
//Question(question: "Какие художники вам нравятся?", category: .moviesAndArt)
//Question(question: "Какие направления в искусстве вам интересны?", category: .moviesAndArt)
//Question(question: "Какие картины вам запомнились?", category: .moviesAndArt)
//Question(question: "Какие музеи стоит посетить?", category: .moviesAndArt)
//Question(question: "Какие скульптуры произвели на вас впечатление?", category: .moviesAndArt)
//Question(question: "Какие произведения искусства изменили историю?", category: .moviesAndArt)
//Question(question: "Какие виды искусства вам ближе всего?", category: .moviesAndArt)
//Question(question: "Какие современные художники вам известны?", category: .moviesAndArt)
//Question(question: "Какие архитектурные здания вдохновляют вас?", category: .moviesAndArt)
//Question(question: "Какие искусства развиваются в последние десятилетия?", category: .moviesAndArt)
////Nature
//Question(question: "Какие растения вам нравятся?", category: .nature)
//Question(question: "Какие природные явления вас поражают?", category: .nature)
//Question(question: "Какие леса или горы вы бы хотели посетить?", category: .nature)
//Question(question: "Какие реки или озёра вам известны?", category: .nature)
//Question(question: "Какие экосистемы вам наиболее впечатляют?", category: .nature)
//Question(question: "Какие природные ресурсы считаются важными для человечества?", category: .nature)
//Question(question: "Какие национальные парки стоит посетить?", category: .nature)
//Question(question: "Какие виды растений можно встретить дома?", category: .nature)
//Question(question: "Какие виды растений можно встретить в вашем регионе?", category: .nature)
//Question(question: "Какие изменения в природе вы замечаете в последнее время?", category: .nature)
