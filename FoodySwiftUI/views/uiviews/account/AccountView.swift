//
//  AccountView.swift
//  FoodySwiftUI
//
//  Created by Eder  Padilla on 25/07/22.
//

import SwiftUI

struct AccountView: View {
    
    @FocusState private var focusTextField: FormTextField?
    @StateObject var viewModel = AccountViewModel()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("First name", text: $viewModel.user.firstName)
                        .focused($focusTextField, equals: .firstName)
                        .onSubmit { focusTextField = .lastName }
                        .submitLabel(.next)
                    
                    TextField("Last Name", text: $viewModel.user.lastName)
                        .focused($focusTextField, equals: .lastName)
                        .onSubmit { focusTextField = .email }
                        .submitLabel(.next)
                    
                    TextField("Email", text: $viewModel.user.email)
                        .focused($focusTextField, equals: .email)
                        .onSubmit { focusTextField = nil }
                        .submitLabel(.continue)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    
                    DatePicker("Birthdate",
                               selection: $viewModel.user.birthDate,
                               in: ...Date(),
                               displayedComponents: .date)
                    .onChange(of: viewModel.user.birthDate) { newValue in
                        print("🚀newValue \(newValue)")
                    }
                    
                    Button {
                        viewModel.saveChanges()
                    } label: {
                        Label("Save",
                              systemImage: "square.and.arrow.down")
                    }
                } header: {
                    Text("😇Account")
                }
                
                Section {
                    Toggle("Extra Napkings",
                           isOn: $viewModel.user.extraNapkings)
                    
                    Toggle("Frequent Refills",
                           isOn: $viewModel.user.frequentRefills)
                } header: {
                    Text("🎛Request")
                }.tint(.primaryOrange)
                
            }
            .navigationTitle("Account 😃")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Button("Disiss") { focusTextField = nil }
                }
            }
            .onTapGesture {
                hideKeyboard()
            }
        }
        .onAppear {
            viewModel.getUser()
        }
        .alert(item: $viewModel.accountUi.alertItem) { alert in
            Alert(title: alert.title,
                  message: alert.message,
                  dismissButton: alert.dismissButton)
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView(viewModel: AccountViewModel())
    }
}
