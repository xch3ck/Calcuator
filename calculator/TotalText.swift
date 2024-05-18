//
//  TotalText.swift
//  calculator
//
//  Created by Josh Holubiak on 5/9/24.
//

import SwiftUI

struct TotalText: View {
    var value: String = "0"
    var body: some View {
        Text(value)
            .font(.system(size: 60))
            .fontWeight(.light)
            .padding()
            .foregroundColor(.white)
            .lineLimit(1)
    }
}

#Preview {
    TotalText()
        .background(.black)
}
