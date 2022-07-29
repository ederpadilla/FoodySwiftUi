//
//  ContentView.swift
//  FoodySwiftUI
//
//  Created by Eder  Padilla on 25/07/22.
//

import SwiftUI

struct HomeTabView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        TabView {
            HomeListView()
                .tabItem { Label("Home", systemImage: "house.circle") }
            OrdersView()
                .tabItem { Label("Orders", systemImage: "clock") }
                .badge(order.items.count)
            AccountView(viewModel: AccountViewModel())
                .tabItem { Label("Account", systemImage: "person") }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabView()
            .preferredColorScheme(.dark)
    }
}
