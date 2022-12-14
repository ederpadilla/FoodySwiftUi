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
    var email: String
    var birthDate: Date
    var extraNapkings: Bool
    var frequentRefills: Bool
    
    init(firstName: String = "",
         lastName: String = "",
         email: String = "",
         birthDate: Date = Date(),
         extraNapkings: Bool = false,
         frequentRefills: Bool = false) {
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.birthDate = birthDate
        self.extraNapkings = extraNapkings
        self.frequentRefills = frequentRefills
    }
}

extension User {
    
    func asUserLocal() -> UserLocal {
        UserLocal(firstName: firstName,
                  lastName: lastName,
                  email: email,
                  birthDate: birthDate,
                  extraNapkings: extraNapkings,
                  frequentRefills: frequentRefills)
    }
}

struct UserLocal: Codable {
    var firstName: String
    var lastName: String
    var email: String
    var birthDate: Date
    var extraNapkings: Bool
    var frequentRefills: Bool
}

extension UserLocal {
    
    func asUser() -> User {
        User(firstName: firstName,
             lastName: lastName,
             email: email,
             birthDate: birthDate,
             extraNapkings: extraNapkings,
             frequentRefills: frequentRefills)
    }
}
