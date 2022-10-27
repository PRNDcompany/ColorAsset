//
//  Converter.swift
//  
//
//  Created by woody on 2022/10/27.
//

import Foundation


struct Converter {
    static func convert(_ input: Double) -> String? {
        let numberFomatter = NumberFormatter()
        numberFomatter.roundingMode = .halfUp
        numberFomatter.maximumSignificantDigits = 3
        return numberFomatter.string(for: input)
    }
}
