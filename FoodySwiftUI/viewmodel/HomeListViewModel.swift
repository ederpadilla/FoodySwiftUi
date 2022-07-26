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
        NetworkManager.shared.getFoodyes { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let foodys):
                    self.homeUI.foodys = foodys
                case .failure(let error):
                    print("error \(error)")
                }
            }
        }
    }
}
