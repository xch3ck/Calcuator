//
//  calculatorButton.swift
//  calculator
//
//  Created by Josh Holubiak on 5/9/24.
//

import SwiftUI

struct CalculatorButton: View {
    var buttonText: String = "1"
    var color: Color = Color(red: 0.169, green: 0.177, blue: 0.194)
    var width: CGFloat = 80
    var action: (CalculatorButton) -> Void = {_ in }
    var mode: CalculatorMode = .notSet
    var body: some View {
        Button{
            action(self)
        } label: {
            Text(buttonText)
                .font(.largeTitle)
                .frame(width: width, height: 80, alignment: .center)
                .background(color)
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 50, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/))
        }
    }
}

#Preview {
    CalculatorButton()
}
