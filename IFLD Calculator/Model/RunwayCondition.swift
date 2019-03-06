//
//  RunwayCondition.swift
//  IFLD Calculator
//
//  Created by Adam Zemmoura on 28/02/2019.
//  Copyright © 2019 Adam Zemmoura. All rights reserved.
//

import Foundation

enum RunwayCondition : String {
    case dry = "Dry"
    case good = "Good"
    case goodToMedium = "Good - Med"
    case medium = "Medium"
    case mediumToPoor = "Med - Poor"
    case poor = "Poor"
    
    static let options : [RunwayCondition] = [.dry, .good, .goodToMedium, .medium, .mediumToPoor, .poor]
    
}
