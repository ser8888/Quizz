//
//  ViewController.swift
//  Quizz
//
//  Created by John Doe on 09/07/2022.
//

import UIKit

class QuestionsViewController: UIViewController {

    
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var questionProgressView: UIProgressView!
    
    @IBOutlet var singleStackView: UIStackView!
    @IBOutlet var singleButtons: [UIButton]!
    
    @IBOutlet var multipleStakeView: UIStackView!
    @IBOutlet var multipleLabels: [UILabel]!
    @IBOutlet var multipleSwitches: [UISwitch]!
    
    
    @IBOutlet var rangedStackView: UIStackView!
    @IBOutlet var rangedLablels: [UILabel]!
    @IBOutlet var rangedSlider: UISlider!
    
    
    private let questions = Question.getQuestions()
    private var questionIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func singleButtonAnswerPressed(_ sender: UIButton) {
    }
    
    @IBAction func multipleButtonAnswerPressed() {
    }
    @IBAction func rangedAnswerButtonPressed() {
    }
    
    
}

// MARK: - Private Methodes
extension QuestionsViewController {
private func updateUI() {
    // Hide  stacks
    for stackView in [singleStackView, multipleStakeView, rangedStackView] {
        stackView?.isHidden = true
        }
    // Извлекаем тккущмй вопрос из массива Question по индексу questionIndex
    let currentQuestion = questions[questionIndex]
    print(currentQuestion)
    
    // Set current quesiton for question Lable
    questionLabel.text = currentQuestion.title
    
    // Progress sloder calculation
    let totalProgress = Float(questionIndex) / Float(questions.count)
    
    // Link progress slider view with progress
    questionProgressView.setProgress(totalProgress, animated: true)
    
    //Show navifation title
    title = "Вопрос № \(questionIndex + 1) из \(questions.count) "
    
    //Показать ответы - лпределить каиегорию, выбрать соответсвующий stackView и тд
    
    showCurrentAnswers(for: currentQuestion.responseType)
    
    
    }
    
    private func showCurrentAnswers(for type: ResponseType) {
        switch type {
        case .single: break
        case .multiple:  break
        case .ranged: break
        }
    }
    
    private func showSingeStackView(with answers: [Answer]) {
        singleStackView.isHidden = false
        
        for (button, answer) in zip(singleButtons, answers) {
            
            
        }
        
     
        
        
    }
}
