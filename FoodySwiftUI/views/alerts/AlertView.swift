//
//  AlertView.swift
//  FoodySwiftUI
//
//  Created by Eder  Padilla on 26/07/22.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
    
}

extension AlertInfo {
    
    func asAlertItem() -> AlertItem {
        AlertItem(title: Text(title),
                  message: Text(message),
                  dismissButton: .default(Text(dismissMessage)))
    }
}

struct AlertContext {
    
    
    static let invalidData = AlertInfo(title: "🚨Server Error🚨",
                                       message: "The data was invalid, contact support").asAlertItem()
    
    static let invalidResponse = AlertInfo(title: "⚠️Server Error⚠️",
                                           message: "Ther was an error on response, please try again later").asAlertItem()
    
    static let invalidURL = AlertInfo(title: "🔌Server Error🔌",
                                      message: "There was an error connecting to the server.").asAlertItem()
    
    static let noInternet = AlertInfo(title: "🌎No internet🌎",
                                      message: "Please check your connnection").asAlertItem()
}
