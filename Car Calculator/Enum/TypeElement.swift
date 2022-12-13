//
//  Element.swift
//  Car Calculator
//
//  Created by Sashka IOS Developer on 09.12.2022.
//

import Foundation

enum TypeElement: CaseIterable {
    case sedan
    case coupe
    case stationWagon
    case minivan
    
    var title: String {
        switch self {
        case .sedan:
            return "Sedan"
        case .coupe:
            return "Coupe"
        case .stationWagon:
            return "Station Wagon"
        case .minivan:
            return "Minivan"
        }
    }
    var value: Int {
        switch self {
        case .sedan:
            return 50
        case .coupe:
            return 200
        case .stationWagon:
            return 300
        case .minivan:
            return 80
            
        }
    }
}
