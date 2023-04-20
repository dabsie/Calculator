//
//  ViewController.swift
//  Calculator Layout iOS13


import UIKit

class ViewController: UIViewController {
    
    var numberFromScreen:Double = 0
    var firstNum: Double  = 0
    var mathSign:Bool = false
    var operation:Int = 0
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func numbers(_ sender: UIButton) {
        if mathSign == true{
            label.text = String(sender.tag)
            mathSign = false
        }
        else {
            label.text = label.text! + String(sender.tag)
        }
        
        numberFromScreen = Double(label.text!)!
    }
    
    @IBAction func buttons(_ sender: UIButton) {
        firstNum = Double(label.text!)!
        
        if label.text != "" && sender.tag != 11 && sender.tag != 12 && sender.tag != 17 {
            if sender.tag == 10 { // процент
                label.text = "%"
            }
            
            else if sender.tag == 13 { // деление
                label.text = "/"
            }
            else if sender.tag == 14 { // умножение
                label.text = "x"
            }
            else if sender.tag == 15 { // минус
                label.text = "-"
            }
            else if sender.tag == 16 { // плюс
                label.text = "+"
            }
            
            mathSign = true;
            operation = sender.tag
        }
        else if sender.tag == 11 { // хз что
            
        }
        else if sender.tag == 12 { // clear
            label.text = "0"
            firstNum = 0
            numberFromScreen = 0
            operation = 0
        }
        else if sender.tag == 17 { // равно
            if operation == 13{
                label.text = String(firstNum / numberFromScreen)
            }
            else if operation == 14{
                label.text = String(firstNum * numberFromScreen)
            }
            else if operation == 15{
                label.text = String(firstNum - numberFromScreen)
            }
            else if operation == 16{
                label.text = String(firstNum + numberFromScreen)
            }
        }
    }
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
}
