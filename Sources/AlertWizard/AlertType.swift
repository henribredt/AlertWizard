//
//  File.swift
//

import Foundation

/// All available kinds of alerts that can be presented using `AlertWizard`
public enum AlertType {
    
// MARK: Available alert types
    
    /// Simple multipurpose alert that provides a primary and a secondary button with completion handlers
    case standard
    
    /// Multipurpose alert that provides a primary and a secondary button with completion handlers
    case standardChoice
}
