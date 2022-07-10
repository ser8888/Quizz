//
//  ResultViewController.swift
//  Quizz
//
//  Created by Sergejs Tiselskis on 09/07/2022.
//

import UIKit
import Foundation

class ResultViewController: UIViewController {
    
    private let questions = Question.getQuestions()
    var resultArray: [Answer] = []
    
    
    
    @IBOutlet var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("   ПРИВЕТ С БОЛЬШОГО БУДУНА")
        print(resultArray)
 
    
        print("S O R T E D    A R R A Y")
 
    
        
        

        print(" T E S T")

        print(" T E S T")
            for index in 0..<resultArray.count {
             print(resultArray[index])

       }
  
        
    }

}
