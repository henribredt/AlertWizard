# AlertWizard 🧙🏻‍♂️

This package lets you easily create different alerts in SwiftUI with the call of a single function.

_As this is my first package that I make publicly available, I'm happy to hear your feedback. Let me know if you enjoy using the package, have troubles or ideas for improvements._

## Requirements

macOS 10.15+, iOS 13+

## Install

Add `https://github.com/henribredt/AlertWizard` in the [“Swift Package Manager” tab in Xcode](https://developer.apple.com/documentation/xcode/adding_package_dependencies_to_your_app).

## Setup
Add a `.alert(...)` modifier to a `View` as shown in the example code.
```swift
@ObservedObject private var alerts = AlertWizard.shared

View {}
.alert(isPresented: $alerts.showAlert) {
    alerts.getCurrentAlert()
}
```
AlertWizard is a singleton, access using `AlertWizard.shared`
## Usage
AlertWizard can show two diffrent kinds of alerts

### Info alert
Display a simple multipurpose alert that provieds a dismiss button with no action associated
```swift
AlertWizard.shared.showInfoAlert(
    title: "Title",
    message: "Message"
)
```

### Choice alert
Display a multipurpose alert that provides a primary and a secondary button with completion handlers
```swift
AlertWizard.shared.showStandardChoiceAlert(
    title: "Title",
    message: "Message",
    primaryButtonTitle: "Print A",
    secondaryButtonTitle: "Print B",
    primaryCompletionHandler: {print("A")},
    secondaryCompletionHandler: {print("B")}
)
```
## Documentation
This package is well documented and includes a .html documentation generated using [Jazzy](https://github.com/realm/jazzy). Open the `index.html` in any browser to view it.

## About
This package was created by Henri Bredt ([@henricreates](https://twitter.com/henricreates)) and published under the MIT license. See [LICENSE](LICENSE) for details.
