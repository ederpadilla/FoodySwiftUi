//
//  AccountViewModel.swift
//  FoodySwiftUI
//
//  Created by Eder  Padilla on 27/07/22.
//

import Foundation

class AccountViewModel: ObservableObject {
    
    @Published var user = User()
    @Published var accountUi = AccountUi()
    private var localDataSource = LocalDataSource.shared
    
    func getUser() {
        localDataSource.getUser { [weak self] result in
            switch result {
            case .success(let user):
                self?.user = user
            case .failure(_):
                self?.accountUi.alertItem = AlertContext.userNotFound
            }
        }
    }
    
    var isValidForm: Bool {
        guard !user.firstName.isEmpty
                && !user.lastName.isEmpty
                && !user.email.isEmpty
        else {
            
            accountUi.alertItem = AlertContext.emptyFields
            return false
        }
        
        guard user.email.isValidEmail else {
            accountUi.alertItem = AlertContext.invalidEmail
            return false
        }
        
        return true
    }
    
    func saveChanges() {
        guard isValidForm else { return }
        localDataSource.storeUser(user) { stored in
            accountUi.alertItem = stored ? AlertContext.userSaveSuccess : AlertContext.userSaveError
        }
    }
}
