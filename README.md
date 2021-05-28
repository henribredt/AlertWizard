# AlertWizard 🧙🏻‍♂️

This package lets easily create diffrent alerts in SwiftUI with the call of a singe function.

I'm happy to hear your feedback, let me know if you enjoy using the package, have troubles or ideas for improvements. 

## Requirements

macOS 10.15+, iOS 14+

## Install

Add `https://github.com/henribredt/AlertWizard` in the [“Swift Package Manager” tab in Xcode](https://developer.apple.com/documentation/xcode/adding_package_dependencies_to_your_app).

##Setup
Add a `.alert(...)` modifier to a `View` as shown in the example code
```
@ObservedObject private var alerts = AlertWizard.shared

View {}
.alert(isPresented: $alerts.showAlert) {
    alerts.getCurrentAlert()
}
```

##Usage
AlertWizard can show two diffrent kinds of alerts

### Info alert
Display a simple multipurpose alert that provieds a dismiss button with no action associated
```
AlertWizard.shared.showInfoAlert(title: "Title", message: "Message")
```

### Choice alert
Display a multipurpose alert that provides a primary and a secondary button with completion handlers
```
AlertWizard.shared.showStandardChoiceAlert(title: "Title", message: "Message", primaryButtonTitle: "Print A", secondaryButtonTitle: "Print B", primaryCompletionHandler: {print("A")}, secondaryCompletionHandler: {print("B)})
```
