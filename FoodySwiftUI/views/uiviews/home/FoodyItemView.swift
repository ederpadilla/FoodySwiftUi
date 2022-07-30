//
//  FoodyItemView.swift
//  FoodySwiftUI
//
//  Created by Eder  Padilla on 25/07/22.
//

import SwiftUI

struct FoodyItemView: View {
    var foodyListItemUI: FoodyListItemUI
    
    var body: some View {
        HStack {
            /*FoodyRemoteImage(url: foodyListItemUI.image)
                .aspectRatio(contentMode: .fit)
                .clipped()
                .frame(width: 120,
                       height: 90)
                .cornerRadius(8)*/
            AsyncImage(url: URL(string: foodyListItemUI.image)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipped()
                    .frame(width: 120,
                           height: 90)
                    .cornerRadius(8)
            } placeholder: {
                Image("food-placeholder")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipped()
                    .frame(width: 120,
                           height: 90)
                    .cornerRadius(8)
            }
            
            VStack(alignment: .leading, spacing: 5) {
                
                Text(foodyListItemUI.name)
                    .font(.title2)
                    .fontWeight(.medium)
                
                Text("$\(foodyListItemUI.price, specifier: "%.2f")")
                    .foregroundColor(.secondary)
                    .fontWeight(.semibold)
            }.padding(.leading)
        }
    }
}

struct FoodyItemView_Previews: PreviewProvider {
    static var previews: some View {
        FoodyItemView(foodyListItemUI: MockData.sampleItemListUi)
    }
}
