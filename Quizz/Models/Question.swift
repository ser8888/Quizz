//
//  Question.swift
//  Quizz
//
//  Created by John Doe on 09/07/2022.
//

struct Question {
    let title: String
    let responseType: ResponseType
    let answers: [Answer]
    
    func getQuestions() -> [Question] {
       [
        Question(
                title: "Какую пищу вы предпочитаете?",
                 responseType: .single,
                 answers: [
                    Answer(title: "Стейк", animal: .dog),
                    Answer(title: "Рыба", animal: .cat),
                    Answer(title: "Морковь", animal: .rabbit),
                    Answer(title: "Кукуруза", animal: .turtle),
                        ]
            )
        ]
    }
}

enum ResponseType {
    case single
    case multiple
    case ranged
}

struct Answer {
    let title: String
    let animal: Animal
}
enum Animal: Character {
    case dog = "🐕"
    case cat = "🐈‍⬛"
    case rabbit = "🐆"
    case turtle = "🐢"
    
    var definitaion: String {
        switch self {
        case .dog:
            return "Вам нравиться"
        case .cat:
            return "Вы себе на уме"
        case .rabbit:
            return "Вам нравиттся все мягкое"
        case .turtle:
            return "Ваша сила в мудрости"
        }
    }
}
