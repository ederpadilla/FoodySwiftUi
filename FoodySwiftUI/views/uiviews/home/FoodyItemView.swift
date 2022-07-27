//
//  FoodyItemView.swift
//  FoodySwiftUI
//
//  Created by Eder  Padilla on 25/07/22.
//

import SwiftUI

struct FoodyItemView: View {
    var foody: FoodyListItemUI
    
    var body: some View {
        HStack {
            FoodyRemoteImage(url: foody.image)
                .aspectRatio(contentMode: .fit)
                .clipped()
                .frame(width: 120,
                       height: 90)
                .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 5) {
                
                Text(foody.name)
                    .font(.title2)
                    .fontWeight(.medium)
                
                Text("$\(foody.price, specifier: "%.2f")")
                    .foregroundColor(.secondary)
                    .fontWeight(.semibold)
            }.padding(.leading)
        }
    }
}

struct FoodyItemView_Previews: PreviewProvider {
    static var previews: some View {
        FoodyItemView(foody: MockData.sampleItemListUi)
    }
}
