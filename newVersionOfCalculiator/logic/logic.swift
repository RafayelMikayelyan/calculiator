//
//  design.swift
//  newVersionOfCalculiator
//
//  Created by Rafayel on 31.08.23.
//

import Foundation



    class CalcService {
    // MARK: - Properties
    private  let displayView: ViewController
    var currentOperation = Operations.noAction
    var currentNumber    = "0"
    var leftOperant      = 0.0
    var rightOperant     = 0.0
    var isDouble         = false
    var result           = ""
    
    init(displayView: ViewController) {
        self.displayView = displayView
    }
        
// MARK: - test function
//    func status() {
//        print(
//            """
//            current number = \(currentNumber)
//            first          = \(leftOperant)
//            second         = \(rightOperant)
//            result         = \(result)
//            """
//        )
//    }
    
// MARK: - function for all cleaning
    func acAction() {
        leftOperant      = 0.0
        rightOperant     = 0.0
        currentOperation = .noAction
        currentNumber    = ""
        result           = ""
        displayView.updateDisplay(text: currentNumber)
//        status()
        displayView.updateDisplay(text: "0")
    }
// MARK: - function for calculation operations cases
    func makeCalculation(operation: Operations) {
        if currentOperation != .noAction {
            
            if currentNumber != "" {
                rightOperant = Double(currentNumber)!
                
                switch operation {
                case .noAction:
                    print("No action")
                case .addition:
                    result = String(leftOperant + rightOperant)
                case .substraction:
                    result = String(leftOperant - rightOperant)
                case .division:
                    result = String(leftOperant / rightOperant)
                case .multiplication:
                    result = String(leftOperant * rightOperant)
                }
                
                leftOperant = Double(result)!
                
                if Double(result)!.truncatingRemainder(dividingBy: 1) == 0 {
                    result = String(Int(Double(result)!))
                }
                currentNumber = result
                displayView.updateDisplay(text: currentNumber)
                currentOperation = .noAction
            }
            
        } else {
            leftOperant = Double(currentNumber) ?? 0.0
            currentNumber = ""
            displayView.updateDisplay(text: "\(Int(leftOperant))")
            currentOperation = operation
        }
        
//        status()
        
    }
// MARK: - function for changing sign from + to - and opposite
    func changeSign() {
        var temp = currentNumber
        if temp.contains("-") {
            let sign = ["-"]
            temp = String(temp.filter { !sign.contains(String($0)) })
            print(temp)
            displayView.updateDisplay(text: temp)
            currentNumber = temp
        } else {
            temp = "-" + currentNumber
            print(temp)
            displayView.updateDisplay(text: temp)
            currentNumber = temp
        }
    }
// MARK: - function for calculating procent
    func percent() {
        currentNumber = String(Double(currentNumber)! / 100)
        displayView.updateDisplay(text: currentNumber)
        result = currentNumber
        leftOperant = Double(result)!
    }
// MARK: - function for calculating division
    func division() {
        makeCalculation(operation: .division)
    }
// MARK: - function for calculating multiplication
    func multiplication() {
        makeCalculation(operation: .multiplication)
    }
        
    func substraction() {
        if (currentNumber == "0") || (currentNumber == "") {
            currentNumber = "-"
            displayView.updateDisplay(text: currentNumber)
        } else {
            makeCalculation(operation: .substraction)
        }
    }
// MARK: - function for calculating addition
    func addition() {
        makeCalculation(operation: .addition)
    }
// MARK: - function for calculating result
    func makeResult() {
        makeCalculation(operation: currentOperation)
    }
// MARK: - function for adding dot
    func dot() {
        if currentNumber.contains(".") {
            return
        } else {
            currentNumber += "."
            displayView.updateDisplay(text: currentNumber)
        }
    }
// MARK: - function for tracking number actions
    func numberAction(number: Int) {
        if currentNumber != "0" {
            currentNumber.append(String(number))
            displayView.updateDisplay(text: currentNumber)
        } else {
            currentNumber = String(number)
            displayView.updateDisplay(text: currentNumber)
        }
    }
// MARK: - function for svipe remooving
    func removeCharacter() {
        if currentNumber.first == "-" && currentNumber.count == 2 || currentNumber.count == 1 {
            currentNumber = "0"
            displayView.updateDisplay(text: currentNumber)
        } else {
            currentNumber.removeLast()
            displayView.updateDisplay(text: currentNumber)
            
            
        }
    }
}
