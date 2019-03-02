//
//  Variant.swift
//  IFLD Calculator
//
//  Created by Adam Zemmoura on 02/03/2019.
//  Copyright © 2019 Adam Zemmoura. All rights reserved.
//

import Foundation

enum AircraftType : String {
    case B777_200 = "777-200"
    case B777_200ER = "777-200ER"
    case B777_300ER = "777-300ER"
    
    static let options : [AircraftType] = [.B777_200, .B777_200ER, .B777_300ER]
    
    static func engineVariant(aircraftType type: AircraftType) -> String {
        switch type {
            case .B777_200 : return "GE90-85B"
            case .B777_200ER : return "Trent 895"
            case .B777_300ER : return "GE90-115BL"
        }
    }
}
