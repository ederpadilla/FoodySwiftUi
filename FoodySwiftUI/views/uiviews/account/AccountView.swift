//
//  AccountView.swift
//  FoodySwiftUI
//
//  Created by Eder  Padilla on 25/07/22.
//

import SwiftUI

struct AccountView: View {
    
    @StateObject var accountViewModel = AccountViewModel()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("First name", text: $accountViewModel.user.firstName)
                    TextField("Last Name", text: $accountViewModel.user.lastName)
                    TextField("Email", text: $accountViewModel.user.email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    
                    DatePicker("Birthdate",
                               selection: $accountViewModel.user.birthDate,
                               in: ...Date(),
                               displayedComponents: .date)
                    
                    Button {
                        print("Save")
                    } label: {
                        Label("Save",
                              systemImage: "square.and.arrow.down")
                    }
                } header: {
                    Text("😇Account")
                }

                Section {
                    Toggle("Extra Napkings", isOn: $accountViewModel.user.extraNapkings)
                        
                    Toggle("Frequent Refills", isOn: $accountViewModel.user.frequentRefills)
                } header: {
                    Text("🎛Request")
                }.tint(.primaryOrange)
                
            }.navigationTitle("Account 😃")
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView(accountViewModel: AccountViewModel())
    }
}
