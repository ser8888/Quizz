//
//  ResultViewController.swift
//  Quizz
//
//  Created by Sergejs Tiselskis on 09/07/2022.
//
import UIKit

class ResultViewController: UIViewController {

    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var definitionLabel: UILabel!
    
    var resultArray: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        convertArray()
       }
    
    @IBAction func exitButton(_ sender: Any) {
        dismiss(animated: true)
    }
}
// MARK: Extrnsions of the actual View Controller.

extension ResultViewController {
    
    private func convertArray() {
        
        let resultArrayConverted = resultArray.map { $0.animal}
        var counts = [Animal: Int]()
        resultArrayConverted.forEach { counts[$0] = (counts[$0] ?? 0) + 1 }
        if let (value, _) = counts.max(by: {$0.1 < $1.1}) {
            let finalCalculatedChoise = value
            showResults(with: finalCalculatedChoise)
        }
    }
    
    private func showResults(with animalCalculated: Animal) {
        resultLabel.text = "Вы - \(animalCalculated.rawValue)"
        definitionLabel.text = animalCalculated.definitaion
    }
    
    
}
