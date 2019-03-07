//
//  LandingDistanceCalculator.swift
//  IFLD Calculator
//
//  Created by Adam Zemmoura on 06/03/2019.
//  Copyright © 2019 Adam Zemmoura. All rights reserved.
//

import Foundation

class LandingDistanceCalculator {
    
    static func calculateLandingDistances(inputData: LandingDistanceInputData) -> [BrakingConfiguration : Int] {
        
        guard let flapSetting = inputData.flapSetting,
            let weight = inputData.aircraftWeightTonnes,
            let reverseThrust = inputData.reverseThrustAvailable,
            let aircraftVariant = inputData.aircraftVariant,
            let wind = inputData.wind,
            let temperature = inputData.temperatueCelcius,
            let runwayCondition = inputData.runwayBrakingAction,
            let pressureMillibars = inputData.pressureMillibars,
            let runway = inputData.runway
            else { fatalError("attempted to calculate distances without all data") }
        
        // 1) find out which set of performance data to use
        let allPerformanceData : LandingPerformanceContainer.LandingPerformanceData
        
        switch aircraftVariant {
            case .B777_200: allPerformanceData = LandingPerformanceContainer.getPerformanceDataFor(variant: aircraftVariant, flapSetting: flapSetting)
            case .B777_200ER: fatalError()
            case .B777_300ER: fatalError()
        }
        
        // 2) get data for reported braking action on the runway
        guard let referenceDistances = allPerformanceData.referenceDistances_200T[runwayCondition],
            let weightAdjustments = allPerformanceData.weightAdjustmentPer5Tonne[runwayCondition],
            let altitudeAdjustments = allPerformanceData.altitudeAdjustmentPer1000FT[runwayCondition],
            let windAdjustments = allPerformanceData.windAdjustmentPer10KTS[runwayCondition],
            let slopeAdjustments = allPerformanceData.slopeAdjustmentPer1Percent[runwayCondition],
            let temperatureAdjustments = allPerformanceData.tempAdjustmentPer10DegreesC[runwayCondition],
            let vrefAdjustments = allPerformanceData.vrefAdjustmentPer5KtsAboveVref30[runwayCondition],
            let reverseThrustAdjustments = allPerformanceData.reverseThrustAdjustment[runwayCondition]
            else { fatalError() }
        
        var correctedDistances : [BrakingConfiguration : Int] = [:]
        
        // 3) For each braking action, get the reference distance and add it to corrected distance
        for (_, brakingConfig) in BrakingConfiguration.options.enumerated() {
            if let referenceDistance = referenceDistances[brakingConfig] {
                correctedDistances[brakingConfig] = referenceDistance
            }
        }
        
        printDistancesToConsole(title: "Reference distances for F\(flapSetting) on a \(aircraftVariant.rawValue)", distances: correctedDistances)
        
        // 4) apply weight corrections
        correctedDistances = applyWeightCorrections(corrections: weightAdjustments, weight: weight, distances: correctedDistances)
        
        // 5) apply altitude adjustments
        correctedDistances = applyAltitudeCorrections(altitudeAdjustments: altitudeAdjustments, runway: runway, distances: correctedDistances)
        
        // 6) apply wind adjustments
        for (brakingAction, distance) in correctedDistances {
            let windCorrectionPer10KnotsHeadwind = Double(windAdjustments[brakingAction]!.head)
            let windCorrectionPer10KnotsTailwind = Double(windAdjustments[brakingAction]!.tail)
            let correctionPerKnotHeadwind = windCorrectionPer10KnotsHeadwind / 10.0
            let correctionPerKnowTailwind = windCorrectionPer10KnotsTailwind / 10.0
            
//            let windCorrections = calculateWindComponents(heading: runway., windDirection: <#T##Int#>, windSpeed: <#T##Int#>)
        }
        
        printDistancesToConsole(title: "Distances corrected for altitude", distances: correctedDistances)
        
        return correctedDistances
        
    }
    
    private static func applyWeightCorrections(corrections: [BrakingConfiguration : (above: Int, below: Int)],
                                               weight : Double,
                                               distances: [BrakingConfiguration : Int]) -> [BrakingConfiguration : Int] {
        
        let REFERENCE_WEIGHT_KG = 200000.0
        var correctedDistances = distances
        
        for (brakingAction, distance) in correctedDistances {
            // compare actual weight to reference weight and find difference
            let difference = weight * 1000 - REFERENCE_WEIGHT_KG
            
            let correctionPerKG_above = Double(corrections[brakingAction]!.above) / 5000.0 // the corrections are per 5 tonnes
            let correctionPerKG_below = Double(corrections[brakingAction]!.below) / 5000.0 // the corrections are per 5 tonnes
            
            
            if difference < 0 {
                // below the reference weight
                let correction = round(correctionPerKG_below * difference)
                correctedDistances[brakingAction] = distance - Int(correction)
            } else if difference > 0 {
                // above the reference weight
                let correction = round(correctionPerKG_above * difference)
                correctedDistances[brakingAction] = distance + Int(correction)
                
            } else {
                break
            }
        }
        
        return correctedDistances
    }
    
    private static func applyAltitudeCorrections(altitudeAdjustments: [BrakingConfiguration : Int],
                                                 runway : Runway,
                                                 distances: [BrakingConfiguration : Int]) -> [BrakingConfiguration : Int] {
        
        var correctedDistances = distances
    
        for (brakingAction, distance) in correctedDistances {
            let altitudeCorrectionPerThousandFeet = Double(altitudeAdjustments[brakingAction]!)
            let altitudeCorrectionPerFoot = altitudeCorrectionPerThousandFeet / 1000.0
            let elevation = Double(runway.getElevationFeet())
            
            if elevation > 0 {
                let correction = round(elevation * altitudeCorrectionPerFoot)
                correctedDistances[brakingAction] = distance + Int(correction)
            } else {
                break
            }
        }
        
        return correctedDistances
    
    }
    
    private static func  calculateWindComponents(heading: Int, windDirection: Int, windSpeed: Int) -> [(component: WindComponent, knots: Double)] {
        
        var results : [(component: WindComponent, knots: Double)] = []
        
        let factoredHeading = heading - 360
        let factoredWindDirection = windDirection - 360
        
        var angle = abs(factoredHeading - factoredWindDirection)
        
        if angle > 180 {
            angle = 360 - angle
        }
        
        if angle == 0 {
            let headwind = Double(windSpeed) * cosine(degrees: angle)
            let crosswind = Double(windSpeed) * sine(degrees: angle)
            
            let headwindComponent = (WindComponent.headwind, abs(headwind))
            let crosswindComponent = (WindComponent.crosswind, abs(crosswind))
            
            results.append(headwindComponent)
            results.append(crosswindComponent)
        }
        else if angle == 90 {
            let crosswind = Double(windSpeed) * sine(degrees: angle)
            let crosswindComponent = (WindComponent.crosswind, abs(crosswind))
            results.append(crosswindComponent)
        }
        else if angle == 180 {
            let tailwind = Double(windSpeed) * cosine(degrees: angle)
            let tailwindComponent = (WindComponent.tailwind, abs(tailwind))
            results.append(tailwindComponent)
        }
        else {
            let tailwind = Double(windSpeed) * cosine(degrees: angle)
            let crosswind = Double(windSpeed) * sine(degrees: angle)
            
            let tailwindComponent = (WindComponent.tailwind, abs(tailwind))
            let crosswindComponent = (WindComponent.crosswind, abs(crosswind))
            
            results.append(tailwindComponent)
            results.append(crosswindComponent)
        }
        
        return results
    }
    
    private static func printDistancesToConsole(title: String, distances: [BrakingConfiguration : Int]) {
        print("\n\n\(title) : \n\n")
        for (brakingAction, distance) in distances {
            print("\(brakingAction.rawValue) : \(distance)m")
        }
    }
    
    private static func cosine(degrees: Int) -> Double {
        let deg = Double(degrees)
        let result = cos(deg * .pi / 180)
        return result
    }
    
    private static func sine(degrees: Int) -> Double {
        let deg = Double(degrees)
        let result = sin(deg * .pi / 180)
        return result
    }
    
}
