//
//  Country.swift
//  Car Calculator
//
//  Created by Sashka IOS Developer on 10.12.2022.
//

import Foundation

enum CountryCar: Int, CaseIterable {
    case ukraine = 0
    case usa = 1
    
    var title: String {
        switch self {
        case .ukraine:
            return "Ukraine"
        case .usa:
            return "USA"
        }
    }
}
