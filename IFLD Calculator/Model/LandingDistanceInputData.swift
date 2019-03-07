//
//  LandingDistanceInputData.swift
//  IFLD Calculator
//
//  Created by Adam Zemmoura on 06/03/2019.
//  Copyright © 2019 Adam Zemmoura. All rights reserved.
//

import Foundation

struct LandingDistanceInputData {
    
    // Aircraft Inputs
    var flapSetting : FlapSetting?
    var aircraftWeightTonnes : Double?
    var reverseThrustAvailable : ReverseThrustAvailable?
    var aircraftVariant : AircraftType?
    
    // Weather inputs
    var wind : (direction: Int, speed: Int)?
    var temperatueCelcius : Int?
    var runwayBrakingAction : RunwayCondition?
    var pressureMillibars : Int?
    
    // Runway
    var runway: Runway?
    
    init(flapSetting: FlapSetting, reverse: ReverseThrustAvailable, wind: (Int, Int), tempCelcius: Int, runwayBrakingAction: RunwayCondition, pressureMillibars: Int) {
        self.flapSetting = flapSetting
        self.reverseThrustAvailable = reverse
        self.wind = wind
        self.temperatueCelcius = tempCelcius
        self.runwayBrakingAction = runwayBrakingAction
        self.pressureMillibars = pressureMillibars
    }
    
    func containsAllRequiredInputs() -> Bool {
        return flapSetting != nil
            && aircraftWeightTonnes != nil
            && reverseThrustAvailable != nil
            && aircraftVariant != nil
            && wind != nil
            && temperatueCelcius != nil
            && runwayBrakingAction != nil
            && pressureMillibars != nil
            && runway != nil
    }
    
}
