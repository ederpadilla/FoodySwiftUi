//
//  FoodySwiftUIApp.swift
//  FoodySwiftUI
//
//  Created by Eder  Padilla on 25/07/22.
//

import SwiftUI

@main
struct FoodySwiftUIApp: App {
    
    var order = Order()
    
    var body: some Scene {
        WindowGroup {
            HomeTabView().environmentObject(order)
        }
    }
}
