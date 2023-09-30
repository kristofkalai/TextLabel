# TextLabel
A custom Label that uses CATextLayer under the hood! 💬

## Setup

Add the following to `Package.swift`:

```swift
.package(url: "https://github.com/stateman92/TextLabel", exact: .init(0, 0, 1))
```

[Or add the package in Xcode.](https://developer.apple.com/documentation/xcode/adding_package_dependencies_to_your_app)

## Usage

```swift
let label = Label()
label.foregroundColor = .black
label.backgroundColor = .clear
label.text = .string("Test label")
...
```

For details see the Example app.
