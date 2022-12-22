# AutoresizingScrollView

For those who are "A very small UIScrollView with a very big content"

[![Platform](https://img.shields.io/cocoapods/p/AutoresizingScrollView.svg?style=flat)](https://github.com/RomanPodymov/AutoresizingScrollView)
[![Cocoapods Compatible](https://img.shields.io/cocoapods/v/AutoresizingScrollView.svg)](https://cocoapods.org/pods/AutoresizingScrollView)

## Installation

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

> CocoaPods 1.1.0+ is required to build AutoresizingScrollView.

To integrate AutoresizingScrollView into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '10.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'AutoresizingScrollView', '~> 1.0.0'
end
```

Then, run the following command:

```bash
$ pod install
```

### Swift Package Manager

[Swift Package Manager](https://swift.org/package-manager/) is a tool for managing the distribution of Swift code. It’s integrated with the Swift build system to automate the process of downloading, compiling, and linking dependencies.

> Xcode 11+ is required to build AutoresizingScrollView using Swift Package Manager.

To integrate AutoresizingScrollView into your Xcode project using Swift Package Manager, add it to the dependencies value of your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/RomanPodymov/AutoresizingScrollView.git", .upToNextMajor(from: "1.0.0"))
]
```

### Manually

If you prefer not to use either of the aforementioned dependency managers, you can integrate AutoresizingScrollView into your project manually.
