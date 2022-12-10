//
//  Country.swift
//  Car Calculator
//
//  Created by Sashka IOS Developer on 10.12.2022.
//

import Foundation

enum CountryCar: Int, CaseIterable {
    case ukrain = 0
    case usa = 1
    
    var title: String {
        switch self {
        case .ukrain:
            return "Ukrain"
        case .usa:
            return "USA"
        }
    }
}
