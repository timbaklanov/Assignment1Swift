//
//  Calculator.swift
//  Assignment1
//
//  Created by Тимур Бакланов on 01.10.2021.
//

import Foundation

class Calculator {
    
    private var items: [Character]
    
    init() {
        items = []
    }
    
    func push(s: String) {
        for char in s {
            items.append(char)
        }
    }
    
    func calc() -> Int {
        var result = 0
        var lastOp: Character = "+"
        
        items = items.filter({$0 != " "})
        
        for char in items {
            if let intValue = char.wholeNumberValue {
                
                switch lastOp {
                case "+":
                    result += intValue
                    break
                case "-":
                    result -= intValue
                    break
                case "/":
                    result /= intValue
                    break
                case "*":
                    result *= intValue
                    break
                default:
                    break
                }
            } else {
                lastOp = char
            }
        }
        return result
    }
    
}
