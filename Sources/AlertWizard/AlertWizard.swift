//
//  AlertWizard.swift
//

import SwiftUI

/**
 Manages the state of application-wide user interface alerts
 - Note: AlertWizard is a singleton, access using `AlertWizard.shared`
 
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
 ```
 AlertWizard.shared.showInfoAlert(title: "Title", message: "Message")
 ```
 
 ##Add a new alert type
 - add a new type to enum `AlertType`
 - add a function `showNewAlert(title: ...)` that customizes the state
 - add a computed property `getNewAlert : Alert` that returns those alerts
 - add a new case to the `getCurrentAlert() -> Alert` function
*/
public class AlertWizard: ObservableObject {
    
// MARK: Properties
    /// Provides access to the AlertWizard singelton
    public static let shared = AlertWizard()
        
    /// Describes if an alert should be displayed
    /// - warning: Should only be used in `.alert(...)` modifiers on a `View` as shown in setup example code
    @Published public var showAlert : Bool = false
    
    // Describes which alert should be displayed
    private var whichAlertToShow : AlertType = AlertType.standard
    
    // alert title and message
    private var alertTitle : String = "No title"
    private var alertMessage : String = "No info"
    
    // primary button
    private var secondaryButtonTitle: String = "Dismiss"
    private var secondaryCompletionHandler: () -> () = {}
    
    // secondary button
    private var primaryButtonTitle: String = "Option 1"
    private var primaryCompletionHandler: () -> () = {}

    /// custom init to override the meberwise initializer, private to hide it
    private init() {}
    
    
// MARK: Functions
    
    ///   Display a simple multipurpose alert that provieds a dismiss button with no action associated
    ///
    /// - Parameter title: Alerts title
    /// - Parameter message: Alerts message
    /// - Parameter buttonTitle: Alerts dismiss button title
    public func showStandardAlert(title: String, message: String, buttonTitle: String) {
        whichAlertToShow = .standard
        alertTitle = title
        alertMessage = message
        secondaryButtonTitle = buttonTitle
        showAlert = true
    }
    
    ///   Display a multipurpose alert that provides a primary and a secondary button with completion handlers
    ///
    /// - Parameter title: Alerts title
    /// - Parameter message: Alerts message
    /// - Parameter primaryButtonTitle: Alerts option button title
    /// - Parameter secondaryButtonTitle: Alerts secondary button title, use this for dismiss if needed
    /// - Parameter primaryCompletionHandler: Code that should be executed if user selected primary button
    /// - Parameter secondaryCompletionHandler: Code that should be executed if user selected secondary button
    public func showStandardChoiceAlert(title: String, message: String, primaryButtonTitle: String, secondaryButtonTitle: String, primaryCompletionHandler: @escaping () -> (), secondaryCompletionHandler: @escaping () -> ()) {
        whichAlertToShow = .standardChoice
        alertTitle = title
        alertMessage = message
        self.secondaryButtonTitle = secondaryButtonTitle
        self.secondaryCompletionHandler = secondaryCompletionHandler
        self.primaryButtonTitle = primaryButtonTitle
        self.primaryCompletionHandler = primaryCompletionHandler
        showAlert = true
    }
    
    /// Returns the last configured alert
    public func getCurrentAlert() -> Alert {
        switch whichAlertToShow {
        case .standard:
            return getStandardAlert
        case .standardChoice:
            return getStandardChoiceAlert
        }
    }
    
// MARK: Interface Alerts
    /// Defines all info alerts
    
    /// Create a new StandardAlert
    private var getStandardAlert: Alert {
        Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text(secondaryButtonTitle)))
    }
    
    /// Create a new StandardChoiceAlert
    private var getStandardChoiceAlert: Alert {
        let primaryButton = Alert.Button.default(Text(primaryButtonTitle)) {
            self.primaryCompletionHandler()
        }
        
        let secondaryButton = Alert.Button.default(Text(secondaryButtonTitle)) {
            self.secondaryCompletionHandler()
        }
        
        return Alert(title: Text(alertTitle),
              message: Text(alertMessage),
              primaryButton: primaryButton,
              secondaryButton: secondaryButton
        )
    }
    
}
