//
//  String+Extensions.swift
//  
//  Created by James Sedlacek on 6/18/23.
//

#if canImport(UIKit)
import UIKit
public typealias FontRepresentable = UIFont
#elseif canImport(AppKit)
import AppKit
public typealias FontRepresentable = NSFont
#endif

extension String {
    /// Returns the size required to render the string with the specified font.
    ///
    /// - Parameter font: The font to be used for calculating the size.
    /// - Returns: The size required to render the string with the specified font.
    ///
    /// - Note: This method calculates the size based on the current string and font attributes.
    public func size(using font: FontRepresentable) -> CGSize {
        let fontAttributes = [NSAttributedString.Key.font: font]
        return self.size(withAttributes: fontAttributes)
    }
}

