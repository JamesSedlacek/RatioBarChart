//
//  Int+Extensions.swift
//
//  Created by James Sedlacek on 12/21/23.
//

import Foundation

extension Int {
    /// Calculates the percentage of this integer relative to a given total.
    ///
    /// The function safely handles division by zero and avoids floating point conversion.
    /// - Parameters:
    ///   - total: The total value used as the denominator in the percentage calculation.
    /// - Returns: The percentage of this integer relative to the total. Returns 0 if the total is zero or negative.
    public func percentage(of total: Int) -> Int {
        guard total > 0 else { return 0 }
        return (self * 100) / total
    }
}
