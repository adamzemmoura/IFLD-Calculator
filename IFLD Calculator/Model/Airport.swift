//
//  Airport.swift
//  IFLD Calculator
//
//  Created by Adam Zemmoura on 04/03/2019.
//  Copyright © 2019 Adam Zemmoura. All rights reserved.
//

import Foundation

struct Airport : Codable {
    private let name : String
    private let icaoCode: String
    private let runways : [Runway]
    
    init(name: String, icaoCode: String, runways: [Runway]){
        self.name = name.lowercased()
        self.icaoCode = icaoCode.uppercased()
        self.runways = runways.sorted(by: {$0.getName() < $1.getName()} )
    }
    
    func getName() -> String {
        return name.capitalized
    }
    
    func getCode() -> String {
        return icaoCode
    }
    
    func getRunways() -> [Runway] {
        return runways
    }
    
}
