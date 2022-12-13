//
//  ModelTypeElement.swift
//  Car Calculator
//
//  Created by Sashka IOS Developer on 13.12.2022.
//

import Foundation

enum ModelTypeElement: CaseIterable {
    case syperCar
    
    var title: String {
        switch self {
        case .syperCar:
            return "SyperCar"
        }
    }
    var value: Int {
        switch self {
        case .syperCar:
            return 500
        }
    }
}
