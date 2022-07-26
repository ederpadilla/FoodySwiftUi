//
//  Alerts.swift
//  FoodySwiftUI
//
//  Created by Eder  Padilla on 26/07/22.
//

import Foundation

struct AlertInfo {
    let title: String
    let message: String
    let dismissMessage: String
    
    init(title: String,
         message: String,
         dismissMessage: String = "Ok") {
        self.title = title
        self.message = message
        self.dismissMessage = dismissMessage
    }
}
