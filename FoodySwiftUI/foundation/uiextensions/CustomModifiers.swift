//
//  CustomModifiers.swift
//  FoodySwiftUI
//
//  Created by Eder  Padilla on 29/07/22.
//

import SwiftUI

struct StandarButtonStyle: ViewModifier {
    
    var color: Color = .primaryOrange
    
    func body(content: Content) -> some View {
        content
            .buttonStyle(.borderedProminent)
            .tint(color)
            .controlSize(.large)
    }
}

struct CusttomFoodyButtonStyle: ButtonStyle {
    
    var color: Color = .primaryOrange
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(height: 50)
            .frame(maxWidth: .infinity)
            .background(color)
            .cornerRadius(16)
            .controlSize(.large)
    }
}
