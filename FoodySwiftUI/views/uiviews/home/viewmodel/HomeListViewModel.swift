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
        NetworkManager.shared.getFoodyes { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let foodys):
                    self?.homeUI.foodys = foodys.asFoodyListItemUI()
                case .failure(let error):
                    self?.handleGetFoodyes(error)
                }
            }
        }
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
