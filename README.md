# ColorAsset

[![Swift](https://img.shields.io/badge/Swift-5.7-orange.svg)]()
[![Version](https://img.shields.io/github/v/release/PRNDcompany/ColorAsset.svg)](https://opensource.org/licenses/Apache-2.0)
[![Platforms](https://img.shields.io/badge/platforms-iOS%20%7C%20macOS%20%7C%20tvOS%20%7C%20watchOS-yellow.svg)]()
[![License](https://img.shields.io/badge/license-MIT-lightgray.svg)](https://opensource.org/licenses/Apache-2.0)

## Why You should use ColorAsset?

- Since iOS 13, UIKit and SwiftUI Color can be managed together
- You can formalize the transition between SwiftUI's Color and UIKit's UIColor in a cool way.


## Usage

Check out the [Example](Example) app for more details.

### initialize

```swift
extension ColorAsset {
    static let brandColor = ColorAsset(hex: "#88FF44")
    static let primaryColor = ColorAsset(named: "primary", bundle: .module, alpha: 1)
}
```

### In SwiftUI

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello")
            .foreground(Color(.brandColor)) // or .foreground(.asset(.brandColor))
    }
}

```

### In UIKit or AppKit

```swift
let label = UILabel()
label.textColor = .asset(.brandColor)
```


## Requirements

|        |Minimum Version|
|-------:|--------------:|
|Swift   |5.7            |
|iOS     |13.0           |
|macOS   |10.15          |
|tvOS    |13.0           |
|watchOS |6.0            |

## Installation

**ColorAsset** is only supported by Swift Package Manager.

To integrate **ColorAsset** into your Xcode project using Swift Package Manager, add it to the dependencies value of your `Package.swift`:

```swift
dependencies: [
  .package(url: "https://github.com/PRNDcompany/ColorAsset", from: "1.0.0"),
]
```

## TODO

- [ ] Support DarkMode
- [ ] Support for multiple variants such as size classes


## License

This library is released under the MIT license. See [LICENSE](LICENSE) for details.
