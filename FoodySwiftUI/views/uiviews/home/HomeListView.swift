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
        ZStack {
            NavigationView {
                List(viewModel.homeUI.foodys) { foody in
                    FoodyItemView(foodyListItemUI: foody)
                        .onTapGesture {
                            didTapFoody(foody)
                        }
                }
                .navigationTitle("🥪 Foods")
                .disabled(viewModel.homeUI.isShowingDetail)
            }
            .onAppear {
                viewModel.getFoodyes()
            }
            .blur(radius: viewModel.homeUI.isShowingDetail ? 20 : 0)
            
            if viewModel.homeUI.isShowingDetail {
                FoodyDetailView(isShowingView: $viewModel.homeUI.isShowingDetail,
                                foody: viewModel.selectedFoody)
            }
            
            if viewModel.homeUI.isLoading {
                LoadingView()
            }
        }
        .alert(item: $viewModel.homeUI.alertItem) { alert in
            Alert(title: alert.title,
                  message: alert.message,
                  dismissButton: alert.dismissButton)
        }
    }
    
    private func didTapFoody(_ foodyListItemUI: FoodyListItemUI) {
        viewModel.selectFoody(foodyListItemUI)
    }
}

struct HomeListView_Previews: PreviewProvider {
    static var previews: some View {
        HomeListView()
    }
}
