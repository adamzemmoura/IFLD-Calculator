//
//  LandingPerformanceData.swift
//  IFLD Calculator
//
//  Created by Adam Zemmoura on 28/02/2019.
//  Copyright © 2019 Adam Zemmoura. All rights reserved.
//

import Foundation


struct LandingPerformanceContainer {
    
    struct LandingPerformanceData {
        let title: String
        let flapSetting : FlapSetting
        let referenceDistances_200T : [RunwayCondition : [ BrakingConfiguration : Int]]
        let weightAdjustmentPer5Tonne : [RunwayCondition : [ BrakingConfiguration : (above: Int, below: Int)]]
        let altitudeAdjustmentPer1000FT : [RunwayCondition : [ BrakingConfiguration : Int]]
        let windAdjustmentPer10KTS : [RunwayCondition : [ BrakingConfiguration : (head: Int, tail: Int)]]
        let slopeAdjustmentPer1Percent : [RunwayCondition : [ BrakingConfiguration : (down: Int, up: Int)]]
        let tempAdjustmentPer10DegreesC : [RunwayCondition : [ BrakingConfiguration : (above: Int, below: Int)]]
        let vrefAdjustmentPer5KtsAboveVref30 : [RunwayCondition : [ BrakingConfiguration : Int]]
        let reverseThrustAdjustment : [RunwayCondition : [ BrakingConfiguration : (one: Int, none: Int)]]
    }
    
    private static let performanceDictionary : [AircraftType : [FlapSetting : LandingPerformanceData] ] = [
        AircraftType.B777_200 :
            [
                FlapSetting.thirty : LandingPerformanceData(title: "Normal Configuration Landing Distance Flaps 30 (777-200/GE90-76B)",
                                                            flapSetting: .thirty,
                                                            referenceDistances_200T: [
                                                                RunwayCondition.dry :
                                                                    [
                                                                        BrakingConfiguration.maxManual : 1185,
                                                                        BrakingConfiguration.autobrakeMax : 1530,
                                                                        BrakingConfiguration.autobrakeFour : 1850,
                                                                        BrakingConfiguration.autobrakeThree : 2175,
                                                                        BrakingConfiguration.autobrakeTwo : 2400,
                                                                        BrakingConfiguration.autobrakeOne : 2545
                                                                        
                                                                ],
                                                                RunwayCondition.good :
                                                                    [
                                                                        BrakingConfiguration.maxManual : 1565,
                                                                        BrakingConfiguration.autobrakeMax : 1660,
                                                                        BrakingConfiguration.autobrakeFour : 1855,
                                                                        BrakingConfiguration.autobrakeThree : 2175,
                                                                        BrakingConfiguration.autobrakeTwo : 2400,
                                                                        BrakingConfiguration.autobrakeOne : 2545
                                                                        
                                                                ],
                                                                RunwayCondition.goodToMedium :
                                                                    [
                                                                        BrakingConfiguration.maxManual : 1805,
                                                                        BrakingConfiguration.autobrakeMax : 1855,
                                                                        BrakingConfiguration.autobrakeFour : 1970,
                                                                        BrakingConfiguration.autobrakeThree : 2225,
                                                                        BrakingConfiguration.autobrakeTwo : 2425,
                                                                        BrakingConfiguration.autobrakeOne : 2560
                                                                        
                                                                ],
                                                                RunwayCondition.medium :
                                                                    [
                                                                        BrakingConfiguration.maxManual : 2040,
                                                                        BrakingConfiguration.autobrakeMax : 2055,
                                                                        BrakingConfiguration.autobrakeFour : 2085,
                                                                        BrakingConfiguration.autobrakeThree : 2275,
                                                                        BrakingConfiguration.autobrakeTwo : 2450,
                                                                        BrakingConfiguration.autobrakeOne : 2575
                                                                        
                                                                ],
                                                                RunwayCondition.mediumToPoor :
                                                                    [
                                                                        BrakingConfiguration.maxManual : 2295,
                                                                        BrakingConfiguration.autobrakeMax : 2310,
                                                                        BrakingConfiguration.autobrakeFour : 2330,
                                                                        BrakingConfiguration.autobrakeThree : 2445,
                                                                        BrakingConfiguration.autobrakeTwo : 2580,
                                                                        BrakingConfiguration.autobrakeOne : 2675
                                                                        
                                                                ],
                                                                RunwayCondition.poor :
                                                                    [
                                                                        BrakingConfiguration.maxManual : 2555,
                                                                        BrakingConfiguration.autobrakeMax : 2560,
                                                                        BrakingConfiguration.autobrakeFour : 2580,
                                                                        BrakingConfiguration.autobrakeThree : 2615,
                                                                        BrakingConfiguration.autobrakeTwo : 2710,
                                                                        BrakingConfiguration.autobrakeOne : 2775
                                                                        
                                                                ]
                    ],
                                                            weightAdjustmentPer5Tonne: [
                                                                RunwayCondition.dry :
                                                                    [
                                                                        BrakingConfiguration.maxManual : (above: 30, below: -5),
                                                                        BrakingConfiguration.autobrakeMax : (above: 25, below: -5),
                                                                        BrakingConfiguration.autobrakeFour : (above: 30, below: -10),
                                                                        BrakingConfiguration.autobrakeThree : (above: 35, below: -10),
                                                                        BrakingConfiguration.autobrakeTwo : (above: 45, below: -25),
                                                                        BrakingConfiguration.autobrakeOne : (above: 50, below: -30),
                                                                ],
                                                                RunwayCondition.good :
                                                                    [
                                                                        BrakingConfiguration.maxManual : (above: 25, below: -10),
                                                                        BrakingConfiguration.autobrakeMax : (above: 30, below: -10),
                                                                        BrakingConfiguration.autobrakeFour : (above: 30, below: -5),
                                                                        BrakingConfiguration.autobrakeThree : (above: 35, below: -10),
                                                                        BrakingConfiguration.autobrakeTwo : (above: 45, below: -25),
                                                                        BrakingConfiguration.autobrakeOne : (above: 50, below: -30),
                                                                ],
                                                                RunwayCondition.goodToMedium :
                                                                    [
                                                                        BrakingConfiguration.maxManual : (above: 30, below: -15),
                                                                        BrakingConfiguration.autobrakeMax : (above: 35, below: -15),
                                                                        BrakingConfiguration.autobrakeFour : (above: 35, below: -10),
                                                                        BrakingConfiguration.autobrakeThree : (above: 35, below: -15),
                                                                        BrakingConfiguration.autobrakeTwo : (above: 45, below: -25),
                                                                        BrakingConfiguration.autobrakeOne : (above: 50, below: -30),
                                                                ],
                                                                RunwayCondition.medium :
                                                                    [
                                                                        BrakingConfiguration.maxManual : (above: 40, below: -25),
                                                                        BrakingConfiguration.autobrakeMax : (above: 40, below: -15),
                                                                        BrakingConfiguration.autobrakeFour : (above: 40, below: -15),
                                                                        BrakingConfiguration.autobrakeThree : (above: 40, below: -15),
                                                                        BrakingConfiguration.autobrakeTwo : (above: 45, below: -25),
                                                                        BrakingConfiguration.autobrakeOne : (above: 50, below: -30),
                                                                ],
                                                                RunwayCondition.mediumToPoor :
                                                                    [
                                                                        BrakingConfiguration.maxManual : (above: 45, below: -30),
                                                                        BrakingConfiguration.autobrakeMax : (above: 50, below: -25),
                                                                        BrakingConfiguration.autobrakeFour : (above: 50, below: -25),
                                                                        BrakingConfiguration.autobrakeThree : (above: 45, below: -25),
                                                                        BrakingConfiguration.autobrakeTwo : (above: 50, below: -30),
                                                                        BrakingConfiguration.autobrakeOne : (above: 55, below: -30),
                                                                ],
                                                                RunwayCondition.poor :
                                                                    [
                                                                        BrakingConfiguration.maxManual : (above: 50, below: -35),
                                                                        BrakingConfiguration.autobrakeMax : (above: 60, below: -35),
                                                                        BrakingConfiguration.autobrakeFour : (above: 60, below: -35),
                                                                        BrakingConfiguration.autobrakeThree : (above: 50, below: -30),
                                                                        BrakingConfiguration.autobrakeTwo : (above: 60, below: -35),
                                                                        BrakingConfiguration.autobrakeOne : (above: 60, below: -35),
                                                                ],
                                                                ],
                                                            altitudeAdjustmentPer1000FT: [
                                                                RunwayCondition.dry :
                                                                    [
                                                                        BrakingConfiguration.maxManual : 25,
                                                                        BrakingConfiguration.autobrakeMax : 30,
                                                                        BrakingConfiguration.autobrakeFour : 45,
                                                                        BrakingConfiguration.autobrakeThree : 50,
                                                                        BrakingConfiguration.autobrakeTwo : 65,
                                                                        BrakingConfiguration.autobrakeOne : 75,
                                                                ],
                                                                RunwayCondition.good :
                                                                    [
                                                                        BrakingConfiguration.maxManual : 35,
                                                                        BrakingConfiguration.autobrakeMax : 40,
                                                                        BrakingConfiguration.autobrakeFour : 45,
                                                                        BrakingConfiguration.autobrakeThree : 50,
                                                                        BrakingConfiguration.autobrakeTwo : 65,
                                                                        BrakingConfiguration.autobrakeOne : 75,
                                                                ],
                                                                RunwayCondition.goodToMedium :
                                                                    [
                                                                        BrakingConfiguration.maxManual : 45,
                                                                        BrakingConfiguration.autobrakeMax : 50,
                                                                        BrakingConfiguration.autobrakeFour : 50,
                                                                        BrakingConfiguration.autobrakeThree : 55,
                                                                        BrakingConfiguration.autobrakeTwo : 65,
                                                                        BrakingConfiguration.autobrakeOne : 75,
                                                                ],
                                                                RunwayCondition.medium :
                                                                    [
                                                                        BrakingConfiguration.maxManual : 60,
                                                                        BrakingConfiguration.autobrakeMax : 60,
                                                                        BrakingConfiguration.autobrakeFour : 60,
                                                                        BrakingConfiguration.autobrakeThree : 60,
                                                                        BrakingConfiguration.autobrakeTwo : 65,
                                                                        BrakingConfiguration.autobrakeOne : 75,
                                                                ],
                                                                RunwayCondition.mediumToPoor :
                                                                    [
                                                                        BrakingConfiguration.maxManual : 70,
                                                                        BrakingConfiguration.autobrakeMax : 70,
                                                                        BrakingConfiguration.autobrakeFour : 70,
                                                                        BrakingConfiguration.autobrakeThree : 70,
                                                                        BrakingConfiguration.autobrakeTwo : 70,
                                                                        BrakingConfiguration.autobrakeOne : 80,
                                                                ],
                                                                RunwayCondition.poor :
                                                                    [
                                                                        BrakingConfiguration.maxManual : 80,
                                                                        BrakingConfiguration.autobrakeMax : 80,
                                                                        BrakingConfiguration.autobrakeFour : 80,
                                                                        BrakingConfiguration.autobrakeThree : 80,
                                                                        BrakingConfiguration.autobrakeTwo : 80,
                                                                        BrakingConfiguration.autobrakeOne : 85,
                                                                ],
                                                                ],
                                                            windAdjustmentPer10KTS: [
                                                                RunwayCondition.dry :
                                                                    [
                                                                        BrakingConfiguration.maxManual : (head: -40, tail: 145),
                                                                        BrakingConfiguration.autobrakeMax : (head: -60, tail: 200),
                                                                        BrakingConfiguration.autobrakeFour : (head: -80, tail: 280),
                                                                        BrakingConfiguration.autobrakeThree : (head: -105, tail: 350),
                                                                        BrakingConfiguration.autobrakeTwo : (head: -115, tail: 405),
                                                                        BrakingConfiguration.autobrakeOne : (head: -130, tail: 455),
                                                                ],
                                                                RunwayCondition.good :
                                                                    [
                                                                        BrakingConfiguration.maxManual : (head: -70, tail: 245),
                                                                        BrakingConfiguration.autobrakeMax : (head: -70, tail: 255),
                                                                        BrakingConfiguration.autobrakeFour : (head: -80, tail: 290),
                                                                        BrakingConfiguration.autobrakeThree : (head: -105, tail: 350),
                                                                        BrakingConfiguration.autobrakeTwo : (head: -115, tail: 405),
                                                                        BrakingConfiguration.autobrakeOne : (head: -130, tail: 455),
                                                                ],
                                                                RunwayCondition.goodToMedium :
                                                                    [
                                                                        BrakingConfiguration.maxManual : (head: -90, tail: 320),
                                                                        BrakingConfiguration.autobrakeMax : (head: -90, tail: 330),
                                                                        BrakingConfiguration.autobrakeFour : (head: -95, tail: 345),
                                                                        BrakingConfiguration.autobrakeThree : (head: -110, tail: 390),
                                                                        BrakingConfiguration.autobrakeTwo : (head: -120, tail: 430),
                                                                        BrakingConfiguration.autobrakeOne : (head: -130, tail: 470),
                                                                ],
                                                                RunwayCondition.medium :
                                                                    [
                                                                        BrakingConfiguration.maxManual : (head: -110, tail: 395),
                                                                        BrakingConfiguration.autobrakeMax : (head: -110, tail: 405),
                                                                        BrakingConfiguration.autobrakeFour : (head: -110, tail: 405),
                                                                        BrakingConfiguration.autobrakeThree : (head: -115, tail: 430),
                                                                        BrakingConfiguration.autobrakeTwo : (head: -125, tail: 455),
                                                                        BrakingConfiguration.autobrakeOne : (head: -130, tail: 485),
                                                                ],
                                                                RunwayCondition.mediumToPoor :
                                                                    [
                                                                        BrakingConfiguration.maxManual : (head: -130, tail: 505),
                                                                        BrakingConfiguration.autobrakeMax : (head: -130, tail: 510),
                                                                        BrakingConfiguration.autobrakeFour : (head: -135, tail: 510),
                                                                        BrakingConfiguration.autobrakeThree : (head: -140, tail: 530),
                                                                        BrakingConfiguration.autobrakeTwo : (head: -145, tail: 545),
                                                                        BrakingConfiguration.autobrakeOne : (head: -150, tail: 565),
                                                                ],
                                                                RunwayCondition.poor :
                                                                    [
                                                                        BrakingConfiguration.maxManual : (head: -155, tail: 615),
                                                                        BrakingConfiguration.autobrakeMax : (head: -155, tail: 620),
                                                                        BrakingConfiguration.autobrakeFour : (head: -160, tail: 620),
                                                                        BrakingConfiguration.autobrakeThree : (head: -160, tail: 625),
                                                                        BrakingConfiguration.autobrakeTwo : (head: -165, tail: 640),
                                                                        BrakingConfiguration.autobrakeOne : (head: -165, tail: 650),
                                                                ],
                                                                ],
                                                            slopeAdjustmentPer1Percent: [
                                                                RunwayCondition.dry :
                                                                    [
                                                                        BrakingConfiguration.maxManual : (down: 10, up: -10),
                                                                        BrakingConfiguration.autobrakeMax : (down: 0, up: 0),
                                                                        BrakingConfiguration.autobrakeFour : (down: 0, up: -5),
                                                                        BrakingConfiguration.autobrakeThree : (down: 10, up: -10),
                                                                        BrakingConfiguration.autobrakeTwo : (down: 25, up: -40),
                                                                        BrakingConfiguration.autobrakeOne : (down: 50, up: -60),
                                                                ],
                                                                RunwayCondition.good :
                                                                    [
                                                                        BrakingConfiguration.maxManual : (down: 35, up: -30),
                                                                        BrakingConfiguration.autobrakeMax : (down: 30, up: -25),
                                                                        BrakingConfiguration.autobrakeFour : (down: 5, up: -5),
                                                                        BrakingConfiguration.autobrakeThree : (down: 10, up: -10),
                                                                        BrakingConfiguration.autobrakeTwo : (down: 25, up: -40),
                                                                        BrakingConfiguration.autobrakeOne : (down: 50, up: -60),
                                                                ],
                                                                RunwayCondition.goodToMedium :
                                                                    [
                                                                        BrakingConfiguration.maxManual : (down: 60, up: -50),
                                                                        BrakingConfiguration.autobrakeMax : (down: 55, up: -45),
                                                                        BrakingConfiguration.autobrakeFour : (down: 45, up: -30),
                                                                        BrakingConfiguration.autobrakeThree : (down: 35, up: -25),
                                                                        BrakingConfiguration.autobrakeTwo : (down: 40, up: -50),
                                                                        BrakingConfiguration.autobrakeOne : (down: 65, up: -65),
                                                                ],
                                                                RunwayCondition.medium :
                                                                    [
                                                                        BrakingConfiguration.maxManual : (down: 80, up: -70),
                                                                        BrakingConfiguration.autobrakeMax : (down: 80, up: -65),
                                                                        BrakingConfiguration.autobrakeFour : (down: 80, up: -60),
                                                                        BrakingConfiguration.autobrakeThree : (down: 60, up: -40),
                                                                        BrakingConfiguration.autobrakeTwo : (down: 60, up: -60),
                                                                        BrakingConfiguration.autobrakeOne : (down: 75, up: -70),
                                                                ],
                                                                RunwayCondition.mediumToPoor :
                                                                    [
                                                                        BrakingConfiguration.maxManual : (down: 135, up: -100),
                                                                        BrakingConfiguration.autobrakeMax : (down: 140, up: -100),
                                                                        BrakingConfiguration.autobrakeFour : (down: 135, up: -95),
                                                                        BrakingConfiguration.autobrakeThree : (down: 120, up: -75),
                                                                        BrakingConfiguration.autobrakeTwo : (down: 115, up: -90),
                                                                        BrakingConfiguration.autobrakeOne : (down: 125, up: -95),
                                                                ],
                                                                RunwayCondition.poor :
                                                                    [
                                                                        BrakingConfiguration.maxManual : (down: 190, up: -125),
                                                                        BrakingConfiguration.autobrakeMax : (down: 195, up: -130),
                                                                        BrakingConfiguration.autobrakeFour : (down: 190, up: -130),
                                                                        BrakingConfiguration.autobrakeThree : (down: 185, up: -110),
                                                                        BrakingConfiguration.autobrakeTwo : (down: 175, up: -120),
                                                                        BrakingConfiguration.autobrakeOne : (down: 180, up: -120),
                                                                ],
                                                                ],
                                                            tempAdjustmentPer10DegreesC: [
                                                                RunwayCondition.dry :
                                                                    [
                                                                        BrakingConfiguration.maxManual : (above: 25, below: -25),
                                                                        BrakingConfiguration.autobrakeMax : (above: 35, below: -35),
                                                                        BrakingConfiguration.autobrakeFour : (above: 45, below: -45),
                                                                        BrakingConfiguration.autobrakeThree : (above: 60, below: -60),
                                                                        BrakingConfiguration.autobrakeTwo : (above: 65, below: -65),
                                                                        BrakingConfiguration.autobrakeOne : (above: 70, below: -70),
                                                                ],
                                                                RunwayCondition.good :
                                                                    [
                                                                        BrakingConfiguration.maxManual : (above: 35, below: -35),
                                                                        BrakingConfiguration.autobrakeMax : (above: 35, below: -35),
                                                                        BrakingConfiguration.autobrakeFour : (above: 45, below: -45),
                                                                        BrakingConfiguration.autobrakeThree : (above: 60, below: -60),
                                                                        BrakingConfiguration.autobrakeTwo : (above: 65, below: -65),
                                                                        BrakingConfiguration.autobrakeOne : (above: 70, below: -70),
                                                                ],
                                                                RunwayCondition.goodToMedium :
                                                                    [
                                                                        BrakingConfiguration.maxManual : (above: 40, below: -40),
                                                                        BrakingConfiguration.autobrakeMax : (above: 40, below: -45),
                                                                        BrakingConfiguration.autobrakeFour : (above: 50, below: -50),
                                                                        BrakingConfiguration.autobrakeThree : (above: 60, below: -60),
                                                                        BrakingConfiguration.autobrakeTwo : (above: 65, below: -65),
                                                                        BrakingConfiguration.autobrakeOne : (above: 70, below: -70),
                                                                ],
                                                                RunwayCondition.medium :
                                                                    [
                                                                        BrakingConfiguration.maxManual : (above: 45, below: -45),
                                                                        BrakingConfiguration.autobrakeMax : (above: 45, below: -50),
                                                                        BrakingConfiguration.autobrakeFour : (above: 50, below: -50),
                                                                        BrakingConfiguration.autobrakeThree : (above: 60, below: -60),
                                                                        BrakingConfiguration.autobrakeTwo : (above: 65, below: -65),
                                                                        BrakingConfiguration.autobrakeOne : (above: 70, below: -70),
                                                                ],
                                                                RunwayCondition.mediumToPoor :
                                                                    [
                                                                        BrakingConfiguration.maxManual : (above: 55, below: -55),
                                                                        BrakingConfiguration.autobrakeMax : (above: 55, below: -60),
                                                                        BrakingConfiguration.autobrakeFour : (above: 60, below: -60),
                                                                        BrakingConfiguration.autobrakeThree : (above: 60, below: -65),
                                                                        BrakingConfiguration.autobrakeTwo : (above: 65, below: -65),
                                                                        BrakingConfiguration.autobrakeOne : (above: 70, below: -70),
                                                                ],
                                                                RunwayCondition.poor :
                                                                    [
                                                                        BrakingConfiguration.maxManual : (above: 65, below: -65),
                                                                        BrakingConfiguration.autobrakeMax : (above: 65, below: -65),
                                                                        BrakingConfiguration.autobrakeFour : (above: 65, below: -70),
                                                                        BrakingConfiguration.autobrakeThree : (above: 65, below: -70),
                                                                        BrakingConfiguration.autobrakeTwo : (above: 70, below: -70),
                                                                        BrakingConfiguration.autobrakeOne : (above: 70, below: -75),
                                                                ],
                                                                ],
                                                            vrefAdjustmentPer5KtsAboveVref30: [
                                                                RunwayCondition.dry :
                                                                    [
                                                                        BrakingConfiguration.maxManual : 40,
                                                                        BrakingConfiguration.autobrakeMax : 75,
                                                                        BrakingConfiguration.autobrakeFour : 90,
                                                                        BrakingConfiguration.autobrakeThree : 110,
                                                                        BrakingConfiguration.autobrakeTwo : 100,
                                                                        BrakingConfiguration.autobrakeOne : 105
                                                                ],
                                                                RunwayCondition.good :
                                                                    [
                                                                        BrakingConfiguration.maxManual : 60,
                                                                        BrakingConfiguration.autobrakeMax : 70,
                                                                        BrakingConfiguration.autobrakeFour : 90,
                                                                        BrakingConfiguration.autobrakeThree : 110,
                                                                        BrakingConfiguration.autobrakeTwo : 100,
                                                                        BrakingConfiguration.autobrakeOne : 105
                                                                ],
                                                                RunwayCondition.goodToMedium :
                                                                    [
                                                                        BrakingConfiguration.maxManual : 65,
                                                                        BrakingConfiguration.autobrakeMax : 75,
                                                                        BrakingConfiguration.autobrakeFour : 90,
                                                                        BrakingConfiguration.autobrakeThree : 110,
                                                                        BrakingConfiguration.autobrakeTwo : 100,
                                                                        BrakingConfiguration.autobrakeOne : 105
                                                                ],
                                                                RunwayCondition.medium :
                                                                    [
                                                                        BrakingConfiguration.maxManual : 70,
                                                                        BrakingConfiguration.autobrakeMax : 80,
                                                                        BrakingConfiguration.autobrakeFour : 85,
                                                                        BrakingConfiguration.autobrakeThree : 110,
                                                                        BrakingConfiguration.autobrakeTwo : 100,
                                                                        BrakingConfiguration.autobrakeOne : 105
                                                                ],
                                                                RunwayCondition.mediumToPoor :
                                                                    [
                                                                        BrakingConfiguration.maxManual : 75,
                                                                        BrakingConfiguration.autobrakeMax : 80,
                                                                        BrakingConfiguration.autobrakeFour : 85,
                                                                        BrakingConfiguration.autobrakeThree : 105,
                                                                        BrakingConfiguration.autobrakeTwo : 100,
                                                                        BrakingConfiguration.autobrakeOne : 100
                                                                ],
                                                                RunwayCondition.poor :
                                                                    [
                                                                        BrakingConfiguration.maxManual : 80,
                                                                        BrakingConfiguration.autobrakeMax : 80,
                                                                        BrakingConfiguration.autobrakeFour : 80,
                                                                        BrakingConfiguration.autobrakeThree : 105,
                                                                        BrakingConfiguration.autobrakeTwo : 100,
                                                                        BrakingConfiguration.autobrakeOne : 100
                                                                ],
                                                                ],
                                                            reverseThrustAdjustment: [
                                                                RunwayCondition.dry :
                                                                    [
                                                                        BrakingConfiguration.maxManual : (one: 15, none: 45),
                                                                        BrakingConfiguration.autobrakeMax : (one: 0, none: 0),
                                                                        BrakingConfiguration.autobrakeFour : (one: 0, none: 0),
                                                                        BrakingConfiguration.autobrakeThree : (one: 0, none: 0),
                                                                        BrakingConfiguration.autobrakeTwo : (one: 25, none: 25),
                                                                        BrakingConfiguration.autobrakeOne : (one: 140, none: 140),
                                                                ],
                                                                RunwayCondition.good :
                                                                    [
                                                                        BrakingConfiguration.maxManual : (one: 80, none: 195),
                                                                        BrakingConfiguration.autobrakeMax : (one: 85, none: 200),
                                                                        BrakingConfiguration.autobrakeFour : (one: 10, none: 50),
                                                                        BrakingConfiguration.autobrakeThree : (one: 0, none: 0),
                                                                        BrakingConfiguration.autobrakeTwo : (one: 25, none: 25),
                                                                        BrakingConfiguration.autobrakeOne : (one: 140, none: 140),
                                                                ],
                                                                RunwayCondition.goodToMedium :
                                                                    [
                                                                        BrakingConfiguration.maxManual : (one: 160, none: 405),
                                                                        BrakingConfiguration.autobrakeMax : (one: 160, none: 405),
                                                                        BrakingConfiguration.autobrakeFour : (one: 125, none: 335),
                                                                        BrakingConfiguration.autobrakeThree : (one: 65, none: 235),
                                                                        BrakingConfiguration.autobrakeTwo : (one: 60, none: 185),
                                                                        BrakingConfiguration.autobrakeOne : (one: 160, none: 240),
                                                                ],
                                                                RunwayCondition.medium :
                                                                    [
                                                                        BrakingConfiguration.maxManual : (one: 235, none: 610),
                                                                        BrakingConfiguration.autobrakeMax : (one: 230, none: 605),
                                                                        BrakingConfiguration.autobrakeFour : (one: 235, none: 620),
                                                                        BrakingConfiguration.autobrakeThree : (one: 125, none: 465),
                                                                        BrakingConfiguration.autobrakeTwo : (one: 100, none: 345),
                                                                        BrakingConfiguration.autobrakeOne : (one: 185, none: 345),
                                                                ],
                                                                RunwayCondition.mediumToPoor :
                                                                    [
                                                                        BrakingConfiguration.maxManual : (one: 380, none: 1115),
                                                                        BrakingConfiguration.autobrakeMax : (one: 380, none: 1115),
                                                                        BrakingConfiguration.autobrakeFour : (one: 385, none: 1130),
                                                                        BrakingConfiguration.autobrakeThree : (one: 320, none: 1045),
                                                                        BrakingConfiguration.autobrakeTwo : (one: 265, none: 930),
                                                                        BrakingConfiguration.autobrakeOne : (one: 325, none: 900),
                                                                ],
                                                                RunwayCondition.poor :
                                                                    [
                                                                        BrakingConfiguration.maxManual : (one: 530, none: 1620),
                                                                        BrakingConfiguration.autobrakeMax : (one: 535, none: 1625),
                                                                        BrakingConfiguration.autobrakeFour : (one: 535, none: 1640),
                                                                        BrakingConfiguration.autobrakeThree : (one: 510, none: 1620),
                                                                        BrakingConfiguration.autobrakeTwo : (one: 430, none: 1520),
                                                                        BrakingConfiguration.autobrakeOne : (one: 465, none: 1455),
                                                                ]
                    ])
        
            ]
    ]
    
    static func getPerformanceDataFor(variant: AircraftType, flapSetting: FlapSetting) -> LandingPerformanceData {
        return self.performanceDictionary[variant]![flapSetting]!
    }
    
    
}
