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
//    var resultArray: [String: Any] = [:]
    
    
    
    @IBOutlet var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("   ПРИВЕТ С БОЛЬШОГО БУДУНА")
        print(resultArray)
 
    
        
//        dict = resultArray
        
        
        
//        resultArray.sort(on: { $0.animal }, by: < )
        print("S O R T E D    A R R A Y")
 //       print(newArray)
 //       let newArray = resultArray.sorted{ $0.animal.rawValue < $1.animal.rawValue }
  //      print(newArray)
//        print(newArray.first?.animal )
 //       var counts = [ String: Int ]()
 //       resultArray.forEach { counts[$0] = (counts[$0] ?? 0) + 1 }
        
        
        
//        let indexAAA = resultArray.enumerated().map { (_, value. ) in }
        print(" T E S T")
//        print(indexAAA)
        print(" T E S T")
            for index in 0..<resultArray.count {
             print(resultArray[index])
 //               var result[index] = String(resultArray[index])
       }
  
 //       for (key, value) in dictionary(resultArray[]) {
            
//        }
     
        
    }

}
