//
//  FoodyModels.swift
//  FoodySwiftUI
//
//  Created by Eder  Padilla on 25/07/22.
//

import Foundation

struct Foody {
    let id: Int
    let name: String
    let description: String
    let price: Double
    let image: String
    let calories: Int
    let protein: Int
    let carbs: Int
    
    init(
        id: Int = 0,
        name: String = "",
        description: String = "",
        price: Double = 0.0,
        image: String = "",
        calories: Int = 0,
        protein: Int = 0,
        carbs: Int = 0) {
            self.id = id
            self.name = name
            self.description = description
            self.price = price
            self.image = image
            self.calories = calories
            self.protein = protein
            self.carbs = carbs
        }
}

extension Array where Element == Foody {
    
    func asFoodyListItemUI() -> [FoodyListItemUI] {
        compactMap { foody in
            FoodyListItemUI(id: foody.id,
                            name: foody.name,
                            price: foody.price,
                            image: foody.image)
        }
    }
}
