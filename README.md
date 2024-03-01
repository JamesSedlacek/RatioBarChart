# RatioBarChart

[![Swift Package Manager](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg)](https://github.com/apple/swift-package-manager)
[![GitHub stars](https://img.shields.io/github/stars/JamesSedlacek/RatioBarChart.svg)](https://github.com/JamesSedlacek/RatioBarChart/stargazers)
[![GitHub forks](https://img.shields.io/github/forks/JamesSedlacek/RatioBarChart.svg?color=blue)](https://github.com/JamesSedlacek/RatioBarChart/network)
[![GitHub contributors](https://img.shields.io/github/contributors/JamesSedlacek/RatioBarChart.svg?color=blue)](https://github.com/JamesSedlacek/RatioBarChart/network)
<a href="https://github.com/JamesSedlacek/RatioBarChart/pulls"><img src="https://img.shields.io/github/issues-pr/JamesSedlacek/RatioBarChart" alt="Pull Requests Badge"/></a>
<a href="https://github.com/JamesSedlacek/RatioBarChart/issues"><img src="https://img.shields.io/github/issues/JamesSedlacek/RatioBarChart" alt="Issues Badge"/></a>


<p align="left">
  <img src = "https://github.com/JamesSedlacek/RatioBarChart/blob/main/Assets/RatioBarChart.png" width="500">
</p>

<br>

## Requirements

- **iOS**: 15.0 or later.
- **macOS**: 12.0 or later.

<br>

## Installation

You can install `RatioBarChart` using the Swift Package Manager.

1. In Xcode, select "File" > "Add Package Dependencies".
2. Copy & paste the following into the "Search or Enter Package URL" search bar.
```
https://github.com/JamesSedlacek/RatioBarChart.git
```
4. Xcode will fetch the repository & the "RatioBarChart" library will be added to your project.

<br>

## Usage
There's a default initializer that sets the font, text, and colors for a win/loss ratio bar chart.
```swift
import RatioBarChart
import SwiftUI

struct ContentView: View {
    var body: some View {
        RatioBarChart(wins: 50, losses: 50)
    }
}
```

<br>

## Customizations
The initializer allows you to customize the chart's colors, text, & font.
```swift
public init(firstCount: Int, secondCount: Int,
            firstColor: Color, secondColor: Color,
            topLeftText: String, topRightText: String,
            bottomLeftText: String, bottomRightText: String,
            topFont: FontRepresentable = .systemFont(ofSize: 16, weight: .semibold),
            bottomFont: FontRepresentable = .systemFont(ofSize: 14, weight: .medium))
```

<br>

## Author

James Sedlacek, find me on [X/Twitter](https://twitter.com/jsedlacekjr) or [LinkedIn](https://www.linkedin.com/in/jamessedlacekjr/)
