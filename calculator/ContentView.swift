//
//  ContentView.swift
//  calculator
//
//  Created by Josh Holubiak on 5/9/24.
//

import SwiftUI
import CoreData

enum CalculatorMode {
    case notSet
    case addition
    case subtraction
    case multiplication
}

struct ContentView: View{
    @State var currentValue = "0"
    @State var currentMode: CalculatorMode = .notSet
    @State var lastButtonWasMode = false
    @State var savedNum = 0
    @State var currentValueInt = 0
    var body: some View{
        ZStack {
            Color(.black)
            VStack {
                TotalText(value: currentValue)
                HStack {
                    CalculatorButton(buttonText: "1", action: didPressNumber)
                    CalculatorButton(buttonText: "2", action: didPressNumber)
                    CalculatorButton(buttonText: "3", action: didPressNumber)
                    CalculatorButton(buttonText: "X", color: .orange, action: didPressMode,  mode: .multiplication)
                }
                HStack {
                    CalculatorButton(buttonText: "4", action: didPressNumber)
                    CalculatorButton(buttonText: "5", action: didPressNumber)
                    CalculatorButton(buttonText: "6", action: didPressNumber)
                    CalculatorButton(buttonText: "-", color: .orange, action: didPressMode, mode: .subtraction)
                }
                HStack {
                    CalculatorButton(buttonText: "7", action: didPressNumber)
                    CalculatorButton(buttonText: "8", action: didPressNumber)
                    CalculatorButton(buttonText: "9", action: didPressNumber)
                    CalculatorButton(buttonText: "+", color: .orange, action: didPressMode, mode: .addition)
                }
                HStack {
                    CalculatorButton(buttonText: "0", width: 170, action: didPressNumber)
                    CalculatorButton(buttonText: "C", color: .gray, action: didPressClear)
                    CalculatorButton(buttonText: "=", color: .orange, action: didPressEqauls)
                }
            }
        }
        .ignoresSafeArea()
    }
    
    func didPressNumber(button: CalculatorButton) {
        if lastButtonWasMode {
            lastButtonWasMode = false
            currentValueInt = 0
        }
        if let parsedValue = Int("\(currentValueInt)" + button.buttonText) {
            currentValueInt = parsedValue
            updateText()
        } else {
            currentValue = "Error"
            currentValueInt = 0
        }
    }
    
    func didPressMode(button: CalculatorButton) {
        currentMode = button.mode
        lastButtonWasMode = true
    }
    
    func didPressEqauls(button: CalculatorButton) {
        if currentMode == .notSet || lastButtonWasMode {
            return
        }
        
        if currentMode == .addition {
            savedNum += currentValueInt
        } else if currentMode == .subtraction {
            savedNum -= currentValueInt
        } else if currentMode == .multiplication{
            savedNum *= currentValueInt
        }
        
        currentValueInt = savedNum
        updateText()
        lastButtonWasMode = true
    }
    
    func didPressClear(button:CalculatorButton) {
        currentValue = "0"
        currentMode = .notSet
        lastButtonWasMode = false
        savedNum = 0
        currentValueInt = 0
    }
    
    func updateText() {
        if currentMode == .notSet {
            savedNum = currentValueInt
        }
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let num = NSNumber(value: currentValueInt)
        
        currentValue = numberFormatter.string(from: num) ?? "Error"
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View{
        ContentView()
    }
}
