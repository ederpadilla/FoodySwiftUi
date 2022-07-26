//
//  FoodyRemote.swift
//  FoodySwiftUI
//
//  Created by Eder  Padilla on 25/07/22.
//

import Foundation

struct FoodyResponse: Decodable {
    let request: [FoodyRemote]
}

struct FoodyRemote: Decodable {
    let id: Int?
    let name: String?
    let description: String?
    let price: Double?
    let image: String?
    let calories: Int?
    let protein: Int?
    let carbs: Int?
    
    private enum CodingKeys : String, CodingKey {
        case id,
             name,
             description,
             price,
             image = "imageURL",
             calories,
             protein,
             carbs
    }
}

extension FoodyResponse {
    
    func asFoody() -> [Foody] {
        request.compactMap { $0.asFoody() }
    }
}

extension FoodyRemote {
    
    func asFoody() -> Foody {
        Foody(id: id ?? 0,
              name: name ?? "",
              description: description ?? "",
              price: price ?? 0.0,
              image: image ?? "",
              calories: calories ?? 0,
              protein: protein ?? 0,
              carbs: carbs ?? 0)
    }
}

struct MockData {
    static let smapleFoody = Foody(id: 1,
                                   name: "Burgers",
                                   description: "This is a cheesy burger very yummy!",
                                   price: 23.99,
                                   image: "https://seanallen-course-backend.herokuapp.com/images/appetizers/buffalo-chicken-bites.jpg",
                                   calories: 123,
                                   protein: 343,
                                   carbs: 533)
    
    static let smapleFoody2 = Foody(id: 2,
                                   name: "Nachos",
                                   description: "This is a cheesy burger very yummy2!",
                                   price: 25.99,
                                   image: "https://seanallen-course-backend.herokuapp.com/images/appetizers/chicken-avocado-spring-roll.jpg",
                                   calories: 113,
                                   protein: 353,
                                   carbs: 563)
    
    static let smapleFoody3 = Foody(id: 3,
                                   name: "Tacos",
                                   description: "This is a cheesy burger very yummy3!",
                                   price: 55.9999999,
                                   image: "https://seanallen-course-backend.herokuapp.com/images/appetizers/chicken-dumplings.jpg",
                                   calories: 613,
                                   protein: 363,
                                   carbs: 573)
    
    static let foodys = [smapleFoody, smapleFoody2, smapleFoody3, smapleFoody, smapleFoody2, smapleFoody3]
}
