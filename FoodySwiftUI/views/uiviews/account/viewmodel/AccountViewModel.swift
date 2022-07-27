//
//  AccountViewModel.swift
//  FoodySwiftUI
//
//  Created by Eder  Padilla on 27/07/22.
//

import Foundation

class AccountViewModel: ObservableObject {
    
    @Published var user = User()
    
    var isValidForm: Bool {
        guard !user.firstName.isEmpty
                && !user.lastName.isEmpty
                && !user.email.isEmpty
        else { return false }
        
        guard user.email.isValidEmail else {
            return false
        }
        
        return true
    }
}
