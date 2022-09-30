//
//  Formatter+.swift
//  Calculator
//
//  Created by SummerCat on 2022/09/30.
//

import Foundation

extension Formatter {
    static let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.usesSignificantDigits = true
        formatter.maximumSignificantDigits = 20
        formatter.maximumIntegerDigits = 20
        formatter.maximumFractionDigits = 20
        
        return formatter
    }()
    
    static func toFormattedString(from number: String) -> String? {
        let pureNumber = number.replacingOccurrences(of: ",", with: "")
        
        guard let formattedNumber = formatter.number(from: pureNumber) else {
            return nil
        }

        return formatter.string(from: formattedNumber)
    }
}