//
//  EmptyStateView.swift
//  FoodySwiftUI
//
//  Created by Eder  Padilla on 27/07/22.
//

import SwiftUI

struct EmptyStateView: View {
    
    let image: String
    let message: String
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()
            
            VStack {
                Image(systemName: image)
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.primaryOrange)
                    .clipped()
                    .frame(width: 200, height: 150)
                    
                Text(message)
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .padding()
            }
        }
    }
}

struct EmptyStateView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyStateView(image: "note.text",
                       message: "Default")
    }
}
