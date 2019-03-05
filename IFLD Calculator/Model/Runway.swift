//
//  Runway.swift
//  IFLD Calculator
//
//  Created by Adam Zemmoura on 04/03/2019.
//  Copyright © 2019 Adam Zemmoura. All rights reserved.
//

import Foundation

struct Runway : Codable {
    
    private let name : String
    private let distanceMeters : Int
    private let slope : Double
    private let elevationFeet : Int
    
    init(name: String, distanceMeters: Int, slope: Double, elevationFeet: Int) {
        self.name = name
        self.distanceMeters = distanceMeters
        self.slope = slope
        self.elevationFeet = elevationFeet
    }
    
    func getName() -> String {
        return name
    }
    
    func getDistanceMeters() -> Int {
        return distanceMeters
    }
    
    func getSlope() -> Double {
        return slope
    }
    
    func getElevationFeet() -> Int {
        return elevationFeet
    }
    
    func getOrientation() -> Int {
        return orientation
    }
    
}



