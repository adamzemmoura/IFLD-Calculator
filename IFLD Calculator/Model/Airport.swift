//
//  Airport.swift
//  IFLD Calculator
//
//  Created by Adam Zemmoura on 04/03/2019.
//  Copyright © 2019 Adam Zemmoura. All rights reserved.
//

import Foundation

struct Airport : Codable {
    let name : String
    let runways : [Runway]
}
