//
//  RatioBarChart.swift
//
//  Created by James Sedlacek on 6/18/23.
//

import SwiftUI

public struct RatioBarChart: View {
    private let firstCount: Int
    private let secondCount: Int
    private let firstColor: Color
    private let secondColor: Color
    private let topLeftText: String
    private let topRightText: String
    private let bottomLeftText: String
    private let bottomRightText: String
    private let topFont: FontRepresentable
    private let bottomFont: FontRepresentable
    private let isFirstShowing: Bool
    private let isSecondShowing: Bool

    public init(firstCount: Int, secondCount: Int,
                firstColor: Color, secondColor: Color,
                topLeftText: String, topRightText: String,
                bottomLeftText: String, bottomRightText: String,
                topFont: FontRepresentable = .systemFont(ofSize: 16, weight: .semibold),
                bottomFont: FontRepresentable = .systemFont(ofSize: 14, weight: .medium)) {
        self.firstCount = firstCount
        self.secondCount = secondCount
        self.firstColor = firstColor
        self.secondColor = secondColor
        self.topLeftText = topLeftText
        self.topRightText = topRightText
        self.bottomLeftText = bottomLeftText
        self.bottomRightText = bottomRightText
        self.topFont = topFont
        self.bottomFont = bottomFont
        self.isFirstShowing = firstCount > 0
        self.isSecondShowing = secondCount > 0
    }

    public var body: some View {
        GeometryReader { geoReader in
            VStack(alignment: .center, spacing: 8) {
                topSection(geoReader.size.width)
                LinearGradientBar(firstCount: firstCount, secondCount: secondCount,
                                  firstColor: firstColor, secondColor: secondColor)
                bottomSection(geoReader.size.width)
            }
        }
        .frame(height: 60)
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 8)
    }

    private func topSection(_ containerViewWidth: CGFloat) -> some View {
        HStack(spacing: .zero) {
            if isFirstShowing {
                Text(topLeftText)
                    .foregroundStyle(firstColor)
                Spacer(minLength: .zero)
            }
            if isSecondShowing {
                Text(topRightText)
                    .foregroundStyle(secondColor)
                    .fixedSize()
            }
            Spacer()
                .frame(width: topSpacerWidth(containerViewWidth))
        }
        .padding(.bottom, -2)
        .font(Font(topFont))
    }

    private func bottomSection(_ containerViewWidth: CGFloat) -> some View {
        HStack(spacing: .zero) {
            if isFirstShowing {
                Text(bottomLeftText)
                    .foregroundStyle(firstColor)
                Spacer(minLength: .zero)
            }
            if isSecondShowing {
                Text(bottomRightText)
                    .foregroundStyle(secondColor)
                    .fixedSize()
            }
            Spacer()
                .frame(width: bottomSpacerWidth(containerViewWidth))
        }
        .font(Font(bottomFont))
    }

    /// Calculates the width of the spacer in the top section.
    /// - Parameter containerViewWidth: The width of the container view.
    /// - Returns: The width of the spacer.
    private func topSpacerWidth(_ containerViewWidth: CGFloat) -> CGFloat {
        let secondPercentage = secondCount.percentage(of: firstCount + secondCount)
        let topRightTextWidth = topRightText.size(using: topFont).width
        let spacerWidth = (containerViewWidth * CGFloat(secondPercentage) / 100) - topRightTextWidth
        if (spacerWidth < 0 || pinToRight(containerViewWidth)) && firstCount != 0 { return 0 }
        return spacerWidth
    }

    /// Calculates the width of the spacer in the bottom section.
    /// - Parameter containerViewWidth: The width of the container view.
    /// - Returns: The width of the spacer.
    private func bottomSpacerWidth(_ containerViewWidth: CGFloat) -> CGFloat {
        let secondPercentage = secondCount.percentage(of: firstCount + secondCount)
        let bottomRightTextWidth = bottomRightText.size(using: bottomFont).width
        let spacerWidth = (containerViewWidth * CGFloat(secondPercentage) / 100) - bottomRightTextWidth
        if (spacerWidth < 0 || pinToRight(containerViewWidth)) && firstCount != 0 { return 0 }
        return spacerWidth
    }

    /// Determines if the text should be pinned to the right side of the container view.
    /// - Parameter containerViewWidth: The width of the container view.
    /// - Returns: A boolean value indicating whether the text should be pinned to the right.
    private func pinToRight(_ containerViewWidth: CGFloat) -> Bool {
        let secondPercentage = secondCount.percentage(of: firstCount + secondCount)
        let bottomLeftTextWidth = bottomLeftText.size(using: bottomFont).width
        let rightSideWidth = (containerViewWidth * CGFloat(secondPercentage) / 100)
        return containerViewWidth < rightSideWidth + bottomLeftTextWidth
    }
}

// MARK: Initializers
extension RatioBarChart {
    public init(wins: Int, losses: Int) {
        let winPercentage = wins.percentage(of: wins + losses)
        let lossPercentage = 100 - winPercentage
        self.init(firstCount: wins, secondCount: losses,
                  firstColor: .green, secondColor: .red,
                  topLeftText: "\(wins)",
                  topRightText: "\(losses)",
                  bottomLeftText: "\(winPercentage)% Won",
                  bottomRightText: "\(lossPercentage)% Lost")
    }
}

// MARK: Interactive Previews
struct RatioBarChart_Previews: PreviewProvider {
    struct RatioBarChartPreview: View {
        @State private var wins = 20.0
        @State private var losses = 30.0

        var body: some View {
            VStack(spacing: 32) {
                RatioBarChart(wins: Int(wins),
                              losses: Int(losses))
                HStack(spacing: 32) {
                    VStack(alignment: .leading) {
                        Text("Wins")
                        Slider(value: $wins, in: 0...100, step: 1)
                    }
                    VStack(alignment: .leading) {
                        Text("Losses")
                        Slider(value: $losses, in: 0...100, step: 1)
                    }
                }
            }
            .padding()
        }
    }

    static var previews: some View {
        RatioBarChartPreview()
    }
}

//#Preview {
//    VStack(spacing: 32) {
//        RatioBarChart(wins: 50, losses: 0)
//        RatioBarChart(wins: 50, losses: 5)
//        RatioBarChart(wins: 50, losses: 15)
//        RatioBarChart(wins: 50, losses: 50)
//        RatioBarChart(wins: 10, losses: 50)
//        RatioBarChart(wins: 5, losses: 50)
//        RatioBarChart(wins: 0, losses: 50)
//    }
//    .padding()
//}
