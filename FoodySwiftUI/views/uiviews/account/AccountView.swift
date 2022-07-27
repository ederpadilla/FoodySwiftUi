//
//  AccountView.swift
//  FoodySwiftUI
//
//  Created by Eder  Padilla on 25/07/22.
//

import SwiftUI

struct AccountView: View {
    
    @State var user: User
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("First name", text: $user.firstName)
                    TextField("Last Name", text: $user.lastName)
                    TextField("Email", text: $user.emailName)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    
                    DatePicker("Birthdate",
                               selection: $user.birthDate,
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
            }.navigationTitle("Account 😃")
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView(user: User())
    }
}
