//
//  ViewController.swift
//  Assignment1
//
//  Created by Тимур Бакланов on 01.10.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var advancedButton: UIButton!
    @IBOutlet weak var historyLabel: UILabel!
    let operations = ["/", "*", "-", "+"]
    let numbers = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
    var isButtonPressed = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func digitPressed(_ sender: UIButton) {
        if (resultLabel.text == "Error!") {
            resultLabel.text = "";
            resultLabel.textColor = UIColor.black;
        }
        
        if (resultLabel.text == "") {
            if let symb = sender.titleLabel?.text {
                if (operations.contains(symb)) {
                    resultLabel.text = "Error!"
                    resultLabel.textColor = UIColor.red
                    return
                }
            }
        }
        
        if (sender.titleLabel?.text == "C") {
            resultLabel.text = ""
        } else if (sender.titleLabel?.text == "=") {
            if (resultLabel.text != "Error!") {
                var cl = Calculator()
                cl.push(s: resultLabel.text!)
                if (isButtonPressed == true) {
                    historyLabel.text! += "\(resultLabel.text!) = \(cl.calc())\n"
                }
                resultLabel.text = "\(cl.calc())"
            }
        } else {
            if let symb = sender.titleLabel?.text {
                if (operations.contains(symb)) {
                    if (operations.contains((resultLabel.text?.suffix(2).trimmingCharacters(in: .whitespacesAndNewlines))!)) {
                        resultLabel.text = "Error!"
                        resultLabel.textColor = UIColor.red
                    } else {
                        resultLabel.text! += symb + " ";
                    }
                } else if (numbers.contains(symb))  {
                    if (numbers.contains((resultLabel.text?.suffix(2).trimmingCharacters(in: .whitespacesAndNewlines))!)) {
                        resultLabel.text = "Error!"
                        resultLabel.textColor = UIColor.red
                    } else {
                        resultLabel.text! += symb + " ";
                    }
                }
            }
        }
    }
    
    
    @IBAction func advancedModeClicked(_ sender: Any) {
        if isButtonPressed == false {
            advancedButton.setTitle("Standard - No History", for: .normal)
            historyLabel.adjustsFontSizeToFitWidth = true
            historyLabel.minimumScaleFactor = 0.5
            historyLabel.numberOfLines = 0;
            historyLabel.backgroundColor = UIColor.gray
            historyLabel.text = ""
            isButtonPressed = true
        } else {
            advancedButton.setTitle("Advanced - With History", for: .normal)
            historyLabel.backgroundColor = UIColor.white
            historyLabel.text = ""
            isButtonPressed = false
        }
    }
    
}

