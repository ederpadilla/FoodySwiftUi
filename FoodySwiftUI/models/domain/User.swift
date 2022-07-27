//
//  User.swift
//  FoodySwiftUI
//
//  Created by Eder  Padilla on 27/07/22.
//

import Foundation

struct User {
    var firstName: String
    var lastName: String
    var emailName: String
    var birthDate: Date
    
    init(firstName: String = "",
         lastName: String = "",
         emailName: String = "",
         birthDate: Date = Date()) {
        self.firstName = firstName
        self.lastName = lastName
        self.emailName = emailName
        self.birthDate = birthDate
    }
}
