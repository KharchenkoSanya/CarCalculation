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

enum FuelElement: CaseIterable {
    case petrol
    case diesel
    case gas
    case electro
    
    var title: String {
        switch self {
        case .petrol:
            return "Petrol"
        case .diesel:
            return "Diesel"
        case .gas:
            return "Gas"
        case .electro:
            return "Electro"
        }
    }
    var value: Int {
        switch self {
        case .petrol:
            return 200
        case .diesel:
            return 300
        case .gas:
            return 150
        case .electro:
            return 500
            
        }
    }
}
