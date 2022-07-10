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
    
    static func getQuestions() -> [Question] {
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
            ),
        Question(
                title: "Что вам нравиться больше?",
                responseType: .multiple,
                 answers: [
                    Answer(title: "Плавать", animal: .dog),
                    Answer(title: "Спать", animal: .cat),
                    Answer(title: "Обнимашки", animal: .rabbit),
                    Answer(title: "Есть", animal: .turtle),
                        ]
            ),
        Question(
                title: "Любите ли вы поездки на машине?",
                responseType: .ranged,
                 answers: [
                    Answer(title: "Очкую", animal: .cat),
                    Answer(title: "Не очень", animal: .rabbit),
                    Answer(title: "Пох", animal: .turtle),
                    Answer(title: "Очень да", animal: .dog),
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
    case rabbit = "🐰"
    case turtle = "🐢"
    
    var definitaion: String {
        switch self {
        case .dog:
            return "Вам нравиться гавкать на прохожих и обгладывать косточки"
        case .cat:
            return "Вы себе на уме и не только себе и сведёте с ума кого угодно"
        case .rabbit:
            return "Вам нравится все мягкое и затяжное секс. Берегите себя)"
        case .turtle:
            return "Ваша сила в мудрости и в скорости , тише едешь дальше будешь."
        }
    }
}


