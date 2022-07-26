//
//  HomeUIModels.swift
//  FoodySwiftUI
//
//  Created by Eder  Padilla on 26/07/22.
//

import Foundation

struct HomeUI {
    
    var foodys: [FoodyListItemUI]
    
    init(foodys: [FoodyListItemUI] = []) {
        self.foodys = foodys
    }
}

struct FoodyListItemUI: Identifiable {
    let id: Int
    let name: String
    let price: Double
    let image: String
}
