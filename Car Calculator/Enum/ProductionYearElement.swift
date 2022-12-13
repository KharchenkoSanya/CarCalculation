//
//  ProductionYearElement.swift
//  Car Calculator
//
//  Created by Sashka IOS Developer on 13.12.2022.
//

import Foundation

enum ProductionYearElement: CaseIterable {
    case twoThousandFifteenth
    case twoThousandSixteenth
    case twoThousandSeventeenth
    case twoThousandEighteenth
    case twoThousandNineteenth
    case twoThousandTwenty
    case twoThousandTwentyOne
    case twoThousandTwentyTwo
    
    var title: String {
        switch self {
        case .twoThousandFifteenth:
            return "2015"
        case .twoThousandSixteenth:
            return "2016"
        case .twoThousandSeventeenth:
            return "2017"
        case .twoThousandEighteenth:
            return "2018"
        case .twoThousandNineteenth:
            return "2019"
        case .twoThousandTwenty:
            return "2020"
        case.twoThousandTwentyOne:
            return "2021"
        case .twoThousandTwentyTwo:
            return "2022"
        }
    }
    var value: Int {
        switch self {
        case .twoThousandFifteenth:
            return 500
        case .twoThousandSixteenth:
            return 1000
        case .twoThousandSeventeenth:
            return 1500
        case .twoThousandEighteenth:
            return 2000
        case .twoThousandNineteenth:
            return 3000
        case .twoThousandTwenty:
            return 4000
        case.twoThousandTwentyOne:
            return 5000
        case .twoThousandTwentyTwo:
            return 8000
        }
    }
}
