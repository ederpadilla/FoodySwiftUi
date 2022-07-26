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
