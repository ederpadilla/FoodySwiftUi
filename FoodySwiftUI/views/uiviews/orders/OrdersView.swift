//
//  OrderView.swift
//  FoodySwiftUI
//
//  Created by Eder  Padilla on 25/07/22.
//

import SwiftUI

struct OrdersView: View {
    var body: some View {
        NavigationView {
            Text("Orders")
                .navigationTitle("Orders 🍻")
        }
    }
}

struct OrdersView_Previews: PreviewProvider {
    static var previews: some View {
        OrdersView()
    }
}
