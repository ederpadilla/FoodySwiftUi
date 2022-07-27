//
//  FoodyDetailView.swift
//  FoodySwiftUI
//
//  Created by Eder  Padilla on 26/07/22.
//

import SwiftUI

struct FoodyDetailView: View {
    
    @Binding var isShowingView: Bool
    let foody: Foody
    
    var body: some View {
        VStack {
            Image("asian-flank-steak")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipped()
                .frame(maxWidth: .infinity,
                       minHeight: 210)
            
            Spacer()
            
            VStack {
                Text(foody.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text(foody.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding(8)
                
                NutritionFoodyView(foody: foody)
            }
            
            Spacer()
            
            Button {
                isShowingView = false
            } label: {
                Label("$\(foody.price, specifier: "%.2f") - Add to Order",
                      systemImage: "fork.knife.circle.fill")
                .frame(maxWidth: .infinity)
            }
            .padding(.bottom, 30)
            .padding(.leading, 16)
            .padding(.trailing, 16)
            .buttonStyle(.borderedProminent)
            
        }
        .frame(width: screenWidth - (screenWidth / 6),
               height: screenHeight - (screenHeight / 4),
               alignment: .center)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(XMarkButtonView(isShowingView: $isShowingView),
                 alignment: .topTrailing)
    }
}

struct FoodyDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FoodyDetailView(isShowingView: .constant(false),
                        foody: MockData.smapleFoody)
    }
}
