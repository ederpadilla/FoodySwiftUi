//
//  HomeListView.swift
//  FoodySwiftUI
//
//  Created by Eder  Padilla on 31/07/22.
//

import SwiftUI

struct HomeListWithPresenterView: View {
    
    @ObservedObject var presenter: HomePresenter
    @State private var foodyDetailView: FoodyDetailPresenterView?
    
    var body: some View {
        NavigationView {
            switch presenter.state {
            case .showFoodys(let foodys):
                List(foodys) { foody in
                    FoodyItemView(foodyListItemUI: foody)
                        .listRowSeparator(.hidden)
                        .onTapGesture {
                            didTapFoody(foody)
                        }
                }
                .listStyle(.plain)
                .navigationTitle("🥪 Foods")
                
            case .showLoading:
                LoadingView()
            case .showAlertItem(let alertItem):
                alert(item: .constant(alertItem)) { alert in
                    Alert(title: alert.title,
                          message: alert.message,
                          dismissButton: alert.dismissButton)
                }
            case .openDetailView(let selectedFoody):
                AnyView(FoodyDetailPresenterView(state: $presenter.state,
                                                           foody: selectedFoody))
            case .hideDetailView:
                self
            }
        }.task {
            presenter.fetchFoodys()
        }
    }
    
    private func didTapFoody(_ foodyListItemUI: FoodyListItemUI) {
        presenter.selectFoody(foodyListItemUI)
    }
}
