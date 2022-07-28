//
//  Order.swift
//  FoodySwiftUI
//
//  Created by Eder  Padilla on 28/07/22.
//

import Foundation

class Order: ObservableObject {
    
    @Published var items: [Foody] = []
    
    func add(_ foody: Foody) {
        items.append(foody)
    }
}
