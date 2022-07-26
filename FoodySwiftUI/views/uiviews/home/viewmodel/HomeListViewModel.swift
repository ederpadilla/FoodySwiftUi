//
//  HomeListViewModel.swift
//  FoodySwiftUI
//
//  Created by Eder  Padilla on 26/07/22.
//

import Foundation

class HomeListViewModel: ObservableObject {
    
    
    @Published var homeUI: HomeUI = HomeUI()
    
    
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
        case .unknown:
            return AlertContext.unknown
        }
    }
}
