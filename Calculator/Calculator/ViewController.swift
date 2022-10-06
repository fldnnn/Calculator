//
//  ViewController.swift
//  Calculator
//
//  Created by Fulden Onan on 5.10.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var numberOnScreen: UILabel!
    
    var operation: String = ""
    var firstNumber: String = ""
    var secondNumber: String = ""
    var haveResult: Bool = false
    var resultNumber: String = ""
    var numAfterResult: String = ""

    
    @IBOutlet var calculationButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for button in calculationButtons {
            button.layer.cornerRadius = 10
        }
    }

    @IBAction func numPressed(_ sender: Any) {
        if operation == "" {
            firstNumber += String((sender as AnyObject).tag)
            numberOnScreen.text = firstNumber
        } else if operation != "", !haveResult {
            secondNumber += String((sender as AnyObject).tag)
            numberOnScreen.text = secondNumber
        } else if operation != "", haveResult {
            numAfterResult += String((sender as AnyObject).tag)
            numberOnScreen.text = numAfterResult
        }
    }
    
    @IBAction func clearButton(_ sender: Any) {
        numberOnScreen.text = "0"
        firstNumber = ""
        operation = ""
        secondNumber = ""
        haveResult = false
        resultNumber = ""
        numAfterResult = ""
        
    }
    
    @IBAction func addButton(_ sender: Any) {
        operation = "+"
    }
    
    @IBAction func equalButton(_ sender: Any) {
        resultNumber = String(calculate())
        
        let numArray = resultNumber.components(separatedBy: ".")
        if numArray[1] == "0" {
            numberOnScreen.text = numArray[0]
        } else {
            numberOnScreen.text = resultNumber
        }
        numAfterResult = ""
    }
    
    func calculate() -> Double {
        if operation == "+" {
            if !haveResult {
                haveResult = true
                return Double(firstNumber)! + Double(secondNumber)!
            } else {
                return Double(resultNumber)! + Double(numAfterResult)!
            }
        }
        return 0
    }
}
