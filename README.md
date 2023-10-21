# TextLabel
A custom Label that uses CATextLayer under the hood! 💬

## Setup

Add the following to `Package.swift`:

```swift
.package(url: "https://github.com/stateman92/TextLabel", exact: .init(0, 0, 1))
```

[Or add the package in Xcode.](https://developer.apple.com/documentation/xcode/adding-package-dependencies-to-your-app)

## Usage

```swift
let label = TextLabel()
label.foregroundColor = .black
label.backgroundColor = .clear
label.text = .string("Test label")
...
```

For details see the Example app.

## Example

<p style="text-align:center;"><img src="https://github.com/stateman92/TextLabel/blob/main/Resources/screenshot.png?raw=true" width="50%" alt="Example"></p>
