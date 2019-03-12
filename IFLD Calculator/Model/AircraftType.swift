//
//  Variant.swift
//  IFLD Calculator
//
//  Created by Adam Zemmoura on 02/03/2019.
//  Copyright © 2019 Adam Zemmoura. All rights reserved.
//

import Foundation

enum AircraftType : String {
    case B777_200_GE90_76B = "777-200 GE90-76B"
    case B777_200ER_GE90_85B = "777-200ER GE90-85B"
    case B777_200ER_TRENT_895 = "777-200ER Trent 895"
    case B777_300ER_GE90_115BL = "777-300ER GE90-115BL"
    
    static let options : [AircraftType] = [.B777_200_GE90_76B,.B777_200ER_GE90_85B, .B777_200ER_TRENT_895, .B777_300ER_GE90_115BL]
    
    static func engineVariant(aircraftType type: AircraftType) -> String {
        switch type {
            case .B777_200_GE90_76B : return "GE90-76B"
            case .B777_200ER_GE90_85B : return "GE90-85B"
            case .B777_200ER_TRENT_895 : return "Trent 895"
            case .B777_300ER_GE90_115BL : return "GE90-115BL"
        }
    }
}
