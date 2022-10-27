import XCTest
@testable import ColorAsset

final class ColorAssetTests: XCTestCase {
    func test_hexInit() throws {
        
        let target = ColorAsset(hex: "#3362E4")
        
        XCTAssertEqual(target.red, 51.0 / 255.0)
        XCTAssertEqual(target.green, 98.0 / 255.0)
        XCTAssertEqual(target.blue, 228.0 / 255.0)
    }
    
    func test_namedColor() throws {
        let target = ColorAsset(named: "3362E4", bundle: .colorAssetTests, alpha: 1)
        
        XCTAssertEqual(Converter.convert(target.red), Converter.convert(51.0 / 255.0))
        XCTAssertEqual(Converter.convert(target.green), Converter.convert(98.0 / 255.0))
        XCTAssertEqual(Converter.convert(target.blue), Converter.convert(228.0 / 255.0))
    }
}
