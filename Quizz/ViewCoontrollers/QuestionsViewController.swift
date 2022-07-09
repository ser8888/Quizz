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
    @IBOutlet var rangedSlider: UISlider! {
        didSet {
            let answerCount = Float(currentAnswers.count - 1 )
            rangedSlider.maximumValue = answerCount
            rangedSlider.value = answerCount / 2
        }
    }
    
    
    private let questions = Question.getQuestions()
//    private let currentAnswers = questions[questionsIndex].answers - нельзя так делать (один уровень иерархии
    private var currentAnswers: [Answer] {
        questions[questionIndex].answers
    }
    private var questionIndex = 0
    private var answersChosen: [Answer] = []    // создаем массив где будет храниться выбор клиента
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            guard segue.identifier == "showResult" else { return }
            guard let destination = segue.destination as? ResultViewController else { return }
        destination.resultArray = answersChosen
        
        }
  

    @IBAction func singleButtonAnswerPressed(_ sender: UIButton) {              // нажимаем на кнопку, срабатывает IBAction, sender принимает эту кнопку
        guard let indexButton = singleButtons.firstIndex(of: sender) else { return }   // определяем индкс по которому находится эта кнопка в массиве
        let answer = currentAnswers[indexButton]                                        //по этому инлексу извлекаем из массива ответ
        answersChosen.append(answer)                                                    //этот ответ помещаем в ответ answersChosen
        nextQuestion()
    }
    @IBAction func multipleButtonAnswerPressed() {
        for (multipleSwitch, answer) in zip(multipleSwitches, currentAnswers) {
            if multipleSwitch.isOn {
                answersChosen.append(answer)
            }
        }
        nextQuestion()
    }
    @IBAction func rangedAnswerButtonPressed() {
        let index = lrintf(rangedSlider.value)
        answersChosen.append(currentAnswers[index])
        nextQuestion()
    }
    
    
}

// MARK: - Private Methodes
extension QuestionsViewController {
    
private func updateUI() {
    print("МАССИВ ОТВЕТОВ \(answersChosen)")
    // Hide  stacks
    for stackView in [singleStackView, multipleStakeView, rangedStackView] {
        stackView?.isHidden = true
        }
    // Извлекаем тккущмй вопрос из массива Question по индексу questionIndex
    let currentQuestion = questions[questionIndex]
 //   print(currentQuestion)
    
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
        case .single: showSingeStackView(with: currentAnswers )
        case .multiple: showMultipleStackView(with: currentAnswers)
        case .ranged: showRangedStackView(with: currentAnswers)
        }
    }
    
    private func showSingeStackView(with answers: [Answer]) {
        singleStackView.isHidden = false
        
        for (button, answer) in zip(singleButtons, answers) {
            button.setTitle(answer.title, for: .normal)
            
        }
        
        for answer in answers {
            print(answer.title)
        }
    }
    
    private func showMultipleStackView(with answers: [Answer]) {
        multipleStakeView.isHidden = false
        
        for (label, answer) in zip(multipleLabels, answers) {
            label.text = answer.title
        }
    }
    private func showRangedStackView(with answers: [Answer]) {
        rangedStackView.isHidden = false
        
        rangedLablels.first?.text = answers.first?.title
        rangedLablels.last?.text = answers.last?.title
    }
    
    
    private func nextQuestion() {
        print("NEXT QUESTION  \(answersChosen)")
        questionIndex += 1
        
        if questionIndex < questions.count {
            updateUI()
            return
        }
        print("ИТОГОВЫЙ МАССИВ  \(answersChosen), \(answersChosen.count) ")
        
      
        performSegue(withIdentifier: "showResult", sender: nil)
    }
}

