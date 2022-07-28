//
//  HomeListViewModel.swift
//  FoodySwiftUI
//
//  Created by Eder  Padilla on 26/07/22.
//

import Foundation

class HomeListViewModel: ObservableObject {
    
    
    @Published var homeUI: HomeUI = HomeUI()
    private var foodys = [Foody]()
    var selectedFoody = Foody()
    
    func getFoodyes() {
        homeUI.isLoading = true
        NetworkManager.shared.getFoodyes { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let foodys):
                    self?.handleGetFoodyesSuccess(foodys)
                case .failure(let error):
                    self?.handleGetFoodyes(error)
                }
                self?.homeUI.isLoading = false
            }
        }
    }
    
    private func handleGetFoodyesSuccess(_ foodys: [Foody]) {
        self.foodys = foodys
        homeUI.foodys = foodys.asFoodyListItemUI()
    }
    
    private func handleGetFoodyes(_ error: FoodyError) {
        homeUI.alertItem = getErrorAlert(error)
    }
    
    private func getErrorAlert(_ error: FoodyError) -> AlertItem {
        switch error {
        case .invalidURL:
            return AlertContext.invalidURL
        case .invalidResponse:
            return AlertContext.invalidResponse
        case .invalidData:
            return AlertContext.invalidData
        case .noInternet:
            return AlertContext.noInternet
        default:
            return AlertContext.unknown
        }
    }
    
    func selectFoody(_ foodyListItemUI: FoodyListItemUI) {
        if let selectedFoody = foodys.first(where: {  $0.id == foodyListItemUI.id }) {
            self.selectedFoody = selectedFoody
            homeUI.isShowingDetail = true
        }
    }
}
