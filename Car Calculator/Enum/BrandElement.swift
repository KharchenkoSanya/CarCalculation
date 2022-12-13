//
//  BrandElement.swift
//  Car Calculator
//
//  Created by Sashka IOS Developer on 13.12.2022.
//

import Foundation

enum BrandElement: CaseIterable {
    case audi
    case bmw
    case mazda
    case mersedesBenz
    case volkswagen
    
    var title: String {
        switch self {
        case .audi:
            return "Audi"
        case .bmw:
            return "BMW"
        case .mazda:
            return "Mazda"
        case .mersedesBenz:
            return "Mercedes-Benz"
        case .volkswagen:
            return "Volkswagen"
        }
    }
    var value: Int {
        switch self {
        case .audi:
            return 1000
        case .bmw:
            return 1100
        case .mazda:
            return 400
        case .mersedesBenz:
            return 800
        case .volkswagen:
            return 600
            
        }
    }
}
