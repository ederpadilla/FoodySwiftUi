//
//  Order.swift
//  FoodySwiftUI
//
//  Created by Eder  Padilla on 28/07/22.
//

import Foundation

final class Order: ObservableObject {
    
    @Published var items: [Foody] = []
    
    func add(_ foody: Foody) {
        items.append(foody)
    }
    
    func remove(_ index: IndexSet) {
        items.remove(atOffsets: index)
    }
    
    func totalPrice() -> String {
        let total = items.reduce(0) {  $0 + $1.price }
        return "$\(total) - Place ORder"
    }
}
