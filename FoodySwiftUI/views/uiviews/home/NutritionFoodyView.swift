//
//  NutritionFoodyView.swift
//  FoodySwiftUI
//
//  Created by Eder  Padilla on 26/07/22.
//

import SwiftUI

struct NutritionFoodyView: View {
    
    let foody: Foody
    
    var body: some View {
        HStack(spacing: 40) {
            FoodyPortionView(value: foody.calories,
                             type: .calories)
            FoodyPortionView(value: foody.carbs,
                             type: .carbs)
            FoodyPortionView(value: foody.protein,
                             type: .protein)
        }
    }
}

struct NutritionFoodyView_Previews: PreviewProvider {
    static var previews: some View {
        NutritionFoodyView(foody: MockData.smapleFoody)
    }
}

struct FoodyPortionView: View {
    
    let value: Int
    var type: InformationType
    
    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            Text(type.getTypeName())
                .font(.subheadline)
                .foregroundColor(Color(cgColor: UIColor.label.cgColor))
                .fontWeight(.bold)
            
            
            Text(type.shouldShowGrams() ? "\(value) g" : value.description)
                .font(.subheadline)
                .foregroundColor(Color(cgColor: UIColor.label.cgColor))
                .fontWeight(.medium)
        }
    }
}

enum InformationType {
    case calories, carbs, protein
}

extension InformationType {
    
    func getTypeName() -> String {
        switch self {
        case .calories:
            return "Calories"
        case .carbs:
            return "Carbs"
        case .protein:
            return "Protein"
        }
    }
    
    func shouldShowGrams() -> Bool {
        switch self {
        case .calories:
            return false
        case .carbs, .protein:
            return true
        }
    }
}
