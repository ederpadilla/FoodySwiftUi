//
//  ContentView.swift
//  FoodySwiftUI
//
//  Created by Eder  Padilla on 25/07/22.
//

import SwiftUI

struct HomeTabView: View {
    
    var body: some View {
        TabView {
            HomeListView()
                .tabItem {
                    Image(systemName: "house.circle")
                    Text("Home")
                }
            OrderView()
                .tabItem {
                    Image(systemName: "clock")
                    Text("Orders")
                }
            AccountView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Account")
                }
        }.accentColor(Color("primaryOrange"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabView()
            .preferredColorScheme(.dark)
    }
}
