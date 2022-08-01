//
//  FoodyDetailView.swift
//  FoodySwiftUI
//
//  Created by Eder  Padilla on 26/07/22.
//

import SwiftUI

struct FoodyDetailView: View {
    
    @EnvironmentObject var order: Order
    @Binding var isShowingView: Bool
    let foody: Foody
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: foody.image)) { image in
                image
                    .resizable()
                    .clipped()
                    .aspectRatio(contentMode: .fit)
                
            } placeholder: {
                Image("food-placeholder")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipped()
            }
            
            Spacer()
            
            FoodyTitlesView(foody: foody)
            
            Spacer()
            
            Button {
                order.add(foody)
                isShowingView = false
            } label: {
                Label("$\(foody.price, specifier: "%.2f") - Add to Order",
                      systemImage: "fork.knife.circle.fill")
               
            }
            .padding(.bottom, 30)
            .padding(.leading, 16)
            .padding(.trailing, 16)
            .buttonStyle(CusttomFoodyButtonStyle())
            
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

struct FoodyTitlesView: View {
    
    var foody: Foody
    
    var body: some View {
        
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
    }
}

struct FoodyDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FoodyDetailView(isShowingView: .constant(false),
                        foody: MockData.smapleFoody)
    }
}

struct FoodyDetailPresenterView: View {
    
    @EnvironmentObject var order: Order
    @Binding var state: HomeState
    let foody: Foody
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: foody.image)) { image in
                image
                    .resizable()
                    .clipped()
                    .aspectRatio(contentMode: .fit)
                
            } placeholder: {
                Image("food-placeholder")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipped()
            }
            
            Spacer()
            
            FoodyTitlesView(foody: foody)
            
            Spacer()
            
            Button {
                order.add(foody)
                state = .hideDetailView
            } label: {
                Label("$\(foody.price, specifier: "%.2f") - Add to Order",
                      systemImage: "fork.knife.circle.fill")
                
            }
            .padding(.bottom, 30)
            .padding(.leading, 16)
            .padding(.trailing, 16)
            .buttonStyle(CusttomFoodyButtonStyle())
            
        }
        .frame(width: screenWidth - (screenWidth / 6),
               height: screenHeight - (screenHeight / 4),
               alignment: .center)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(XMarkButtonPresenterView(state: $state),
                 alignment: .topTrailing)
    }
}
