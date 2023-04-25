//
//  ViewController.swift
//  Calculator Layout iOS13


import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBOutlet weak var displayResultLabel: UILabel!
    var dotIsPlased = false
    var result:Double = 0
    var operationSign: Int = 0
    var stilltyping = false
    var firstOperand: Double = 0
    var secondOperand: Double = 0
    var currentInput: Double {
        get{
            return Double(displayResultLabel.text!)!
        } set {
            let value = "\(newValue)"
            let valueArray = value.components(separatedBy: ".")
            if valueArray[1] == "0" {
                displayResultLabel.text = "\(valueArray[0])"
            } else {
                displayResultLabel.text = "\(newValue)"
            }
            stilltyping = false
        }
    }
    
    @IBAction func numberPressed(_ sender: UIButton) {
        let number = String(sender.tag)
        if stilltyping {
            if displayResultLabel.text?.count ?? 0 < 20 {
                displayResultLabel.text = displayResultLabel.text! + number
            }
        } else{
            displayResultLabel.text = number
            stilltyping = true
        }
    }
    
    @IBAction func twoOperandsSignPressed(_ sender: UIButton) {
        firstOperand = currentInput
        stilltyping = false
        dotIsPlased = false
        if displayResultLabel.text != "" && sender.tag != 11 && sender.tag != 12 && sender.tag != 17 {
            if sender.tag == 13 { // деление
                displayResultLabel.text = "/"
                operationSign = sender.tag
            }
            else if sender.tag == 14 { // умножение
                displayResultLabel.text = "x"
                operationSign = sender.tag
            }
            else if sender.tag == 15 { // минус
                displayResultLabel.text = "-"
                operationSign = sender.tag
            }
            else if sender.tag == 16 { // плюс
                displayResultLabel.text = "+"
                operationSign = sender.tag
                print(operationSign)
            }
        
        }
        else if sender.tag == 12 { // clear
            displayResultLabel.text = "0"
            firstOperand = 0
            currentInput = 0
            operationSign = 0
            secondOperand = 0
            stilltyping = false
            dotIsPlased = false
        }
    }
    /*func operateWithTwoOperands(operation: (Double, Double) -> Double) {
        currentInput = operation(firstOperand, secondOperand)
        stilltyping = false
    }
    */
    @IBAction func equalSignPressed(_ sender: UIButton) {
            if stilltyping {
                secondOperand = currentInput
                if operationSign == 13{
                    currentInput = firstOperand / secondOperand
                    stilltyping = false
                }
                else if operationSign == 14{
                    currentInput = firstOperand * secondOperand
                    stilltyping = false
                }
                else if operationSign == 15{
                    currentInput = firstOperand - secondOperand
                    stilltyping = false
                }
                else if operationSign == 16{
                    currentInput = firstOperand + secondOperand
                    stilltyping = false
                }
            }
            dotIsPlased = false
        }
    
    @IBAction func percentButtonPressed(_ sender: UIButton) {
        operationSign = sender.tag
        
        if firstOperand == 0{
            displayResultLabel.text = "0"
        }else {
            secondOperand = firstOperand + (firstOperand * currentInput / 100)
            currentInput = secondOperand
        }
        stilltyping = false
    }
    
    @IBAction func plusminusButtonPressed(_ sender: UIButton) {
        currentInput = 0 - currentInput
    }
    
    @IBAction func dotButtonPressed(_ sender: UIButton) {
        if stilltyping && !dotIsPlased {
            displayResultLabel.text = displayResultLabel.text! + "."
            dotIsPlased = true
            
        }
        else if stilltyping && !dotIsPlased {
            displayResultLabel.text = "0."
        }
    }
}
