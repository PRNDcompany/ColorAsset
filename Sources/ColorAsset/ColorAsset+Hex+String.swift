//
//  ColorAsset+Hex.swift
//  
//
//  Created by PRND on 2021/07/09.
//

import Foundation


public extension ColorAsset {
    
    var hex: String {
        let components = colorType.components
        let rgb:Int = (Int)(components.red*255)<<16 | (Int)(components.green*255)<<8 | (Int)(components.blue*255)<<0
        return NSString(format:"#%06x", rgb) as String
    }
    
    init(hex: String) {
        do {
            try self.init(rgba_throws: hex)
        } catch {
            self.init(hex6: 0xFFFFFF)
        }
    }
    
    init?(hex: String?) {
        guard let hex = hex else {
            return nil
        }
        self.init(hex: hex)
    }
    /**
     The rgba string representation of color with alpha of the form #RRGGBBAA/#RRGGBB, throws error.
     
     - parameter rgba: String value.
     */
    init(rgba_throws rgba: String) throws {
        guard rgba.hasPrefix("#") else {
            let error = ColorInputError.missingHashMarkAsPrefix(rgba)
            print(error.localizedDescription)
            throw error
        }
        
        let hexString: String = String(rgba[String.Index(utf16Offset: 1, in: rgba)...])
        var hexValue:  UInt64 = 0
        
        guard Scanner(string: hexString).scanHexInt64(&hexValue) else {
            let error = ColorInputError.unableToScanHexValue(rgba)
            print(error.localizedDescription)
            throw error
        }
        
        switch (hexString.count) {
        case 3:
            self.init(hex3: UInt16(hexValue))
        case 4:
            self.init(hex4: UInt16(hexValue))
        case 6:
            self.init(hex6: UInt32(hexValue))
        case 8:
            self.init(hex8: UInt32(hexValue))
        default:
            let error = ColorInputError.mismatchedHexStringLength(rgba)
            throw error
        }
    }
}
