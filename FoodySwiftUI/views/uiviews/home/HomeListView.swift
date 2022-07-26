//
//  HomeListView.swift
//  FoodySwiftUI
//
//  Created by Eder  Padilla on 25/07/22.
//

import SwiftUI

struct HomeListView: View {
    
    @StateObject var viewModel = HomeListViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.homeUI.foodys) { foody in
                FoodyItemView(foody: foody)
            }
            .navigationTitle("🥪 Foods")
        }
        .onAppear {
            viewModel.getFoodyes()
        }
    }
}

struct HomeListView_Previews: PreviewProvider {
    static var previews: some View {
        HomeListView()
    }
}
