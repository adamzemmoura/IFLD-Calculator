//
//  WeatherInputData.swift
//  IFLD Calculator
//
//  Created by Adam Zemmoura on 02/03/2019.
//  Copyright © 2019 Adam Zemmoura. All rights reserved.
//

import Foundation

struct WeatherInputData {
    
    static let windDirectionData : [Int] = {
        var windDirectionArr : [Int] = []
        for i in 0...360 {
            if i % 10 == 0, i != 0 {
                windDirectionArr.append(i)
            }
        }
        return windDirectionArr
    }()
    
    static let windSpeedData : [Int] = {
        var windSpeeds : [Int] = []
        for i in 0...100 {
            windSpeeds.append(i)
        }
        return windSpeeds
    }()
    
    static let temperatureData : [Int] = {
        var temps : [Int] = []
        for i in -30...50 {
            temps.append(i)
        }
        return temps
    }()
    
}
