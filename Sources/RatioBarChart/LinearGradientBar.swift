//
//  LinearGradientBar.swift
//
//  Created by James Sedlacek on 12/21/23.
//

import SwiftUI

public struct LinearGradientBar: View {
    private let linearGradient: LinearGradient

    public init(firstCount: Int, secondCount: Int,
                firstColor: Color, secondColor: Color) {
        let total = firstCount + secondCount
        let firstPercentage = firstCount.percentage(of: total)
        let secondPercentage = secondCount.percentage(of: total)
        let firstColors = Array(repeating: firstColor, count: firstPercentage)
        let secondColors = Array(repeating: secondColor, count: secondPercentage)
        self.linearGradient = LinearGradient(gradient: Gradient(colors: firstColors + secondColors),
                                             startPoint: .leading,
                                             endPoint: .trailing)
    }

    public var body: some View {
        RoundedRectangle(cornerRadius: 6)
            .fill(linearGradient)
            .frame(height: 12)
            .frame(maxWidth: .infinity)
    }
}

#Preview {
    VStack(spacing: 32) {
        LinearGradientBar(firstCount: 0, secondCount: 15, firstColor: .green, secondColor: .red)
        LinearGradientBar(firstCount: 1, secondCount: 49, firstColor: .green, secondColor: .red)
        LinearGradientBar(firstCount: 5, secondCount: 15, firstColor: .green, secondColor: .red)
        LinearGradientBar(firstCount: 15, secondCount: 15, firstColor: .green, secondColor: .red)
        LinearGradientBar(firstCount: 15, secondCount: 5, firstColor: .green, secondColor: .red)
        LinearGradientBar(firstCount: 49, secondCount: 1, firstColor: .green, secondColor: .red)
        LinearGradientBar(firstCount: 15, secondCount: 0, firstColor: .green, secondColor: .red)

    }
    .padding()
}
