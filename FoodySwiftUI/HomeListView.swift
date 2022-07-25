//
//  HomeListView.swift
//  FoodySwiftUI
//
//  Created by Eder  Padilla on 25/07/22.
//

import SwiftUI

struct HomeListView: View {
    var body: some View {
        NavigationView {
            List(MockData.foodys) { foody in
                FoodyItemView(foody: foody)
            }
            .navigationTitle("🥪 Foods")
        }
    }
}

struct HomeListView_Previews: PreviewProvider {
    static var previews: some View {
        HomeListView()
    }
}
