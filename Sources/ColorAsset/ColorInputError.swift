//
//  ColorInputError.swift
//  
//
//  Created by PRND on 2021/07/09.
//

import Foundation


public enum ColorInputError: Error {
    case missingHashMarkAsPrefix(String)
    case unableToScanHexValue(String)
    case mismatchedHexStringLength(String)
    case unableToOutputHexStringForWideDisplayColor
}

extension ColorInputError: LocalizedError {
    
    public var errorDescription: String? {
        switch self {
        case .missingHashMarkAsPrefix(let hex):
            return "Invalid RGB string, missing '#' as prefix in \(hex)"
            
        case .unableToScanHexValue(let hex):
            return "Scan \(hex) error"
            
        case .mismatchedHexStringLength(let hex):
            return "Invalid RGB string from \(hex), number of characters after '#' should be either 3, 4, 6 or 8"
            
        case .unableToOutputHexStringForWideDisplayColor:
            return "Unable to output hex string for wide display color"
        }
    }
}
