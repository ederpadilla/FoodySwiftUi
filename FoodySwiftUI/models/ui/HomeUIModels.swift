//
//  HomeUIModels.swift
//  FoodySwiftUI
//
//  Created by Eder  Padilla on 26/07/22.
//

import Foundation

struct HomeUI {
    
    var foodys: [FoodyListItemUI]
    var isLoading: Bool
    var alertItem: AlertItem?
    var isShowingDetail: Bool
    
    init(foodys: [FoodyListItemUI] = [],
         isLoading: Bool = false,
         isShowingDetail: Bool = false) {
        self.foodys = foodys
        self.isLoading = isLoading
        self.isShowingDetail = isShowingDetail
    }
}

struct FoodyListItemUI: Identifiable {
    let id: Int
    let name: String
    let price: Double
    let image: String
}
