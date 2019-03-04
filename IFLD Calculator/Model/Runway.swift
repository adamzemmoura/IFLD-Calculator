//
//  Runway.swift
//  IFLD Calculator
//
//  Created by Adam Zemmoura on 04/03/2019.
//  Copyright © 2019 Adam Zemmoura. All rights reserved.
//

import Foundation

struct Runway : Codable {
    let name : String
    let distanceMetres : Int
    let slope : Int
    let elevationFeet : Int 
}
