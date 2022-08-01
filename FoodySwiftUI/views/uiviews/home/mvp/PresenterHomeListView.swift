//
//  HomeListView.swift
//  FoodySwiftUI
//
//  Created by Eder  Padilla on 31/07/22.
//

import SwiftUI

struct HomeListWithPresenterView: View {
    
    var presenter: HomePresenterProtocol
    @ObservedObject var store: HomeStore
    
    init(store: HomeStore, presenter: HomePresenterProtocol) {
        self.store = store
        self.presenter = presenter
    }
    
    var body: some View {
        NavigationView {
            switch store.state {
            case .showFoodys(let foodys):
                AnyView(List(foodys) { foody in
                    FoodyItemView(foodyListItemUI: foody)
                        .listRowSeparator(.hidden)
                        .onTapGesture {
                            didTapFoody(foody)
                        }
                }
                    .listStyle(.plain)
                    .navigationTitle("🥪 Foods")
                )
            case .showLoading:
                LoadingView()
            case .showAlertItem(let alertItem):
                AnyView( alert(item: .constant(alertItem)) { alert in
                    Alert(title: alert.title,
                          message: alert.message,
                          dismissButton: alert.dismissButton)
                } )
            case .openDetailView(let selectedFoody):
                AnyView(FoodyDetailView(isShowingView: .constant(true),
                                        foody: selectedFoody))
            }
        }.task {
            presenter.fetchFoodys()
        }
    }
    
    private func didTapFoody(_ foodyListItemUI: FoodyListItemUI) {
        presenter.selectFoody(foodyListItemUI)
    }
}
