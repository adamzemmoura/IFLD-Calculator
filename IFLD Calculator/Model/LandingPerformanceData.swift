//
//  LandingPerformanceData.swi
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
        let tempAdjustment10DegreesC : [RunwayCondition : [ BrakingConfiguration : (above: Int, below: Int)]]
        let vrefAdjustmentPer5KtsAboveVref30 : [RunwayCondition : [ BrakingConfiguration : Int]]
        let reverseThrustAdjustment : [RunwayCondition : [ BrakingConfiguration : (one: Int, none: Int)]]
    }
    
    private static let performanceDictionary : [AircraftType : [FlapSetting : LandingPerformanceData] ] = [
        AircraftType.B777_200_GE90_76B :
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
                                                                        BrakingConfiguration.autobrakeOne :  2545,
                                                                        
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
                                                                        BrakingConfiguration.autobrakeThree : 2 ,
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
                                                                        BrakingConfiguration.autobrakeThree : 25,
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
                                                            tempAdjustment10DegreesC: [
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
                    ]),
                FlapSetting.twentyFive : LandingPerformanceData(title: "Normal Configuration Landing Distance Flaps 25 (777-200/GE90-76B)",
                                                            flapSetting: .twentyFive,
                                                            referenceDistances_200T: [
                                                                RunwayCondition.dry :
                                                                    [
                                                                        BrakingConfiguration.maxManual :        1240,
                                                                        BrakingConfiguration.autobrakeMax :     1625,
                                                                        BrakingConfiguration.autobrakeFour :    1980,
                                                                        BrakingConfiguration.autobrakeThree :   2335,
                                                                        BrakingConfiguration.autobrakeTwo :     2555,
                                                                        BrakingConfiguration.autobrakeOne :     2695
                                                                        
                                                                ],
                                                                RunwayCondition.good :
                                                                    [
                                                                        BrakingConfiguration.maxManual :       1640,
                                                                        BrakingConfiguration.autobrakeMax :    1740,
                                                                        BrakingConfiguration.autobrakeFour :   1980,
                                                                        BrakingConfiguration.autobrakeThree :  2335,
                                                                        BrakingConfiguration.autobrakeTwo :    2555,
                                                                        BrakingConfiguration.autobrakeOne :    2695
                                                                        
                                                                ],
                                                                RunwayCondition.goodToMedium :
                                                                    [
                                                                        BrakingConfiguration.maxManual :       1890,
                                                                        BrakingConfiguration.autobrakeMax :    1945,
                                                                        BrakingConfiguration.autobrakeFour :   2090,
                                                                        BrakingConfiguration.autobrakeThree :  2385,
                                                                        BrakingConfiguration.autobrakeTwo :    2580,
                                                                        BrakingConfiguration.autobrakeOne :    2710
                                                                        
                                                                ],
                                                                RunwayCondition.medium :
                                                                    [
                                                                        BrakingConfiguration.maxManual :       2135,
                                                                        BrakingConfiguration.autobrakeMax :    2155,
                                                                        BrakingConfiguration.autobrakeFour :   2200,
                                                                        BrakingConfiguration.autobrakeThree :  2435,
                                                                        BrakingConfiguration.autobrakeTwo :    2610,
                                                                        BrakingConfiguration.autobrakeOne :    2725,
                                                                        
                                                                ],
                                                                RunwayCondition.mediumToPoor :
                                                                    [
                                                                        BrakingConfiguration.maxManual :       2405,
                                                                        BrakingConfiguration.autobrakeMax :    2420,
                                                                        BrakingConfiguration.autobrakeFour :   2450,
                                                                        BrakingConfiguration.autobrakeThree :  2600,
                                                                        BrakingConfiguration.autobrakeTwo :    2735,
                                                                        BrakingConfiguration.autobrakeOne :    2825,
                                                                        
                                                                ],
                                                                RunwayCondition.poor :
                                                                    [
                                                                        BrakingConfiguration.maxManual :        2670,
                                                                        BrakingConfiguration.autobrakeMax :     2680,
                                                                        BrakingConfiguration.autobrakeFour :    2700,
                                                                        BrakingConfiguration.autobrakeThree :   2770,
                                                                        BrakingConfiguration.autobrakeTwo :     2860,
                                                                        BrakingConfiguration.autobrakeOne :     2925,
                                                                        
                                                                ]
                    ],
                                                            weightAdjustmentPer5Tonne: [
                                                                RunwayCondition.dry :
                                                                    [
                                                                        BrakingConfiguration.maxManual :        (above: 30, below: -10),
                                                                        BrakingConfiguration.autobrakeMax :     (above: 25, below: -15),
                                                                        BrakingConfiguration.autobrakeFour :    (above: 35, below: -25),
                                                                        BrakingConfiguration.autobrakeThree :   (above: 40, below: -30),
                                                                        BrakingConfiguration.autobrakeTwo :     (above: 50, below:  -30),
                                                                        BrakingConfiguration.autobrakeOne :     (above: 60, below: -45),
                                                                ],
                                                                RunwayCondition.good :
                                                                    [
                                                                        BrakingConfiguration.maxManual :        (above: 30, below: -15),
                                                                        BrakingConfiguration.autobrakeMax :     (above: 30, below: -15),
                                                                        BrakingConfiguration.autobrakeFour :    (above: 35, below: -25),
                                                                        BrakingConfiguration.autobrakeThree :   (above: 40, below: -30),
                                                                        BrakingConfiguration.autobrakeTwo :     (above: 50, below: -40),
                                                                        BrakingConfiguration.autobrakeOne :     (above: 60, below: -45),
                                                                ],
                                                                RunwayCondition.goodToMedium :
                                                                    [
                                                                        BrakingConfiguration.maxManual :        (above: 35, below: -25),
                                                                        BrakingConfiguration.autobrakeMax :     (above: 35, below: -25),
                                                                        BrakingConfiguration.autobrakeFour :    (above: 35, below: -25),
                                                                        BrakingConfiguration.autobrakeThree :   (above: 45, below: -30),
                                                                        BrakingConfiguration.autobrakeTwo :     (above: 50, below: -40),
                                                                        BrakingConfiguration.autobrakeOne :     (above: 60, below: -45),
                                                                ],
                                                                RunwayCondition.medium :
                                                                    [
                                                                        BrakingConfiguration.maxManual :        (above: 40, below: -35),
                                                                        BrakingConfiguration.autobrakeMax :     (above: 40, below: -30),
                                                                        BrakingConfiguration.autobrakeFour :    (above: 40, below: -30),
                                                                        BrakingConfiguration.autobrakeThree :   (above: 45, below: -35),
                                                                        BrakingConfiguration.autobrakeTwo :     (above: 50, below: -40),
                                                                        BrakingConfiguration.autobrakeOne :     (above: 60, below: -45),
                                                                ],
                                                                RunwayCondition.mediumToPoor :
                                                                    [
                                                                        BrakingConfiguration.maxManual :        (above: 50, below: -40),
                                                                        BrakingConfiguration.autobrakeMax :     (above: 50, below: -35),
                                                                        BrakingConfiguration.autobrakeFour :    (above: 50, below: -35),
                                                                        BrakingConfiguration.autobrakeThree :   (above: 50, below: -40),
                                                                        BrakingConfiguration.autobrakeTwo :     (above: 60, below: -45),
                                                                        BrakingConfiguration.autobrakeOne :     (above: 60, below: -50),
                                                                ],
                                                                RunwayCondition.poor :
                                                                    [
                                                                        BrakingConfiguration.maxManual :        (above: 60, below: -45),
                                                                        BrakingConfiguration.autobrakeMax :     (above: 60, below: -45),
                                                                        BrakingConfiguration.autobrakeFour :    (above: 60, below: -45),
                                                                        BrakingConfiguration.autobrakeThree :   (above: 60, below: -45),
                                                                        BrakingConfiguration.autobrakeTwo :     (above: 65, below: -45),
                                                                        BrakingConfiguration.autobrakeOne :     (above: 65, below: -50),
                                                                ],
                                                                ],
                                                            altitudeAdjustmentPer1000FT: [
                                                                RunwayCondition.dry :
                                                                    [
                                                                        BrakingConfiguration.maxManual :        25,
                                                                        BrakingConfiguration.autobrakeMax :     35,
                                                                        BrakingConfiguration.autobrakeFour :    45,
                                                                        BrakingConfiguration.autobrakeThree :   60,
                                                                        BrakingConfiguration.autobrakeTwo :     70,
                                                                        BrakingConfiguration.autobrakeOne :     80,
                                                                ],
                                                                RunwayCondition.good :
                                                                    [
                                                                        BrakingConfiguration.maxManual :        40,
                                                                        BrakingConfiguration.autobrakeMax :     40,
                                                                        BrakingConfiguration.autobrakeFour :    45,
                                                                        BrakingConfiguration.autobrakeThree :   60,
                                                                        BrakingConfiguration.autobrakeTwo :     70,
                                                                        BrakingConfiguration.autobrakeOne :     80,
                                                                ],
                                                                RunwayCondition.goodToMedium :
                                                                    [
                                                                        BrakingConfiguration.maxManual :        50,
                                                                        BrakingConfiguration.autobrakeMax :     50,
                                                                        BrakingConfiguration.autobrakeFour :    50,
                                                                        BrakingConfiguration.autobrakeThree :   60,
                                                                        BrakingConfiguration.autobrakeTwo :     70,
                                                                        BrakingConfiguration.autobrakeOne :     80,
                                                                ],
                                                                RunwayCondition.medium :
                                                                    [
                                                                        BrakingConfiguration.maxManual :        60,
                                                                        BrakingConfiguration.autobrakeMax :     60,
                                                                        BrakingConfiguration.autobrakeFour :    60,
                                                                        BrakingConfiguration.autobrakeThree :   65,
                                                                        BrakingConfiguration.autobrakeTwo :     75,
                                                                        BrakingConfiguration.autobrakeOne :     80,
                                                                ],
                                                                RunwayCondition.mediumToPoor :
                                                                    [
                                                                        BrakingConfiguration.maxManual :        70,
                                                                        BrakingConfiguration.autobrakeMax :     70,
                                                                        BrakingConfiguration.autobrakeFour :    70,
                                                                        BrakingConfiguration.autobrakeThree :   75,
                                                                        BrakingConfiguration.autobrakeTwo :     80,
                                                                        BrakingConfiguration.autobrakeOne :     85,
                                                                ],
                                                                RunwayCondition.poor :
                                                                    [
                                                                        BrakingConfiguration.maxManual :        85,
                                                                        BrakingConfiguration.autobrakeMax :     85,
                                                                        BrakingConfiguration.autobrakeFour :    85,
                                                                        BrakingConfiguration.autobrakeThree :   85,
                                                                        BrakingConfiguration.autobrakeTwo :     85,
                                                                        BrakingConfiguration.autobrakeOne :     90,
                                                                ],
                                                                ],
                                                            windAdjustmentPer10KTS: [
                                                                RunwayCondition.dry :
                                                                    [
                                                                        BrakingConfiguration.maxManual : (head: -40, tail: 150),
                                                                        BrakingConfiguration.autobrakeMax : (head: -65, tail: 205),
                                                                        BrakingConfiguration.autobrakeFour : (head: -85, tail: 295),
                                                                        BrakingConfiguration.autobrakeThree : (head:  -110, tail: 370),
                                                                        BrakingConfiguration.autobrakeTwo : (head:  -120, tail: 420),
                                                                        BrakingConfiguration.autobrakeOne : (head:  -130, tail: 465),
                                                                ],
                                                                RunwayCondition.good :
                                                                    [
                                                                        BrakingConfiguration.maxManual :        (head: -70,    tail: 255),
                                                                        BrakingConfiguration.autobrakeMax :     (head: -75,    tail: 260),
                                                                        BrakingConfiguration.autobrakeFour :    (head: -85,    tail: 300),
                                                                        BrakingConfiguration.autobrakeThree :   (head: -110,   tail: 370),
                                                                        BrakingConfiguration.autobrakeTwo :     (head: -120,   tail: 420),
                                                                        BrakingConfiguration.autobrakeOne :     (head: -130,   tail: 465),
                                                                ],
                                                                RunwayCondition.goodToMedium :
                                                                    [
                                                                        BrakingConfiguration.maxManual :        (head: -90,    tail: 330),
                                                                        BrakingConfiguration.autobrakeMax :     (head: -90,    tail: 335),
                                                                        BrakingConfiguration.autobrakeFour :    (head: -100,   tail: 355),
                                                                        BrakingConfiguration.autobrakeThree :   (head:  -115,  tail: 405),
                                                                        BrakingConfiguration.autobrakeTwo :     (head:  -125,  tail: 445),
                                                                        BrakingConfiguration.autobrakeOne :     (head:  -135,  tail: 480),
                                                                ],
                                                                RunwayCondition.medium :
                                                                    [
                                                                        BrakingConfiguration.maxManual :        (head: -110,    tail: 410),
                                                                        BrakingConfiguration.autobrakeMax :     (head: -110,    tail: 410),
                                                                        BrakingConfiguration.autobrakeFour :    (head: -115,    tail: 415),
                                                                        BrakingConfiguration.autobrakeThree :   (head: -120,    tail: 445),
                                                                        BrakingConfiguration.autobrakeTwo :     (head: -130,    tail: 470),
                                                                        BrakingConfiguration.autobrakeOne :     (head: -140,    tail: 495),
                                                                ],
                                                                RunwayCondition.mediumToPoor :
                                                                    [
                                                                        BrakingConfiguration.maxManual :        (head: -135,    tail: 520),
                                                                        BrakingConfiguration.autobrakeMax :     (head: -135,    tail: 520),
                                                                        BrakingConfiguration.autobrakeFour :    (head: -140,    tail: 525),
                                                                        BrakingConfiguration.autobrakeThree :   (head: -145,    tail: 540),
                                                                        BrakingConfiguration.autobrakeTwo :     (head: -150,    tail: 560),
                                                                        BrakingConfiguration.autobrakeOne :     (head: -155,    tail: 580),
                                                                ],
                                                                RunwayCondition.poor :
                                                                    [
                                                                        BrakingConfiguration.maxManual :        (head: -160,    tail: 625),
                                                                        BrakingConfiguration.autobrakeMax :     (head: -160,    tail: 625),
                                                                        BrakingConfiguration.autobrakeFour :    (head: -160,    tail: 635),
                                                                        BrakingConfiguration.autobrakeThree :   (head: -165,    tail: 640),
                                                                        BrakingConfiguration.autobrakeTwo :     (head: -165,    tail: 650),
                                                                        BrakingConfiguration.autobrakeOne :     (head: -175,    tail: 660),
                                                                ],
                                                                ],
                                                            slopeAdjustmentPer1Percent: [
                                                                RunwayCondition.dry :
                                                                    [
                                                                        BrakingConfiguration.maxManual :        (down: 10,    up: -10),
                                                                        BrakingConfiguration.autobrakeMax :     (down: 0,     up: 0),
                                                                        BrakingConfiguration.autobrakeFour :    (down: 0,     up: -5),
                                                                        BrakingConfiguration.autobrakeThree :   (down:  10,   up: -15),
                                                                        BrakingConfiguration.autobrakeTwo :     (down:  35,   up: -50),
                                                                        BrakingConfiguration.autobrakeOne :     (down:  60,   up: -65),
                                                                ],
                                                                RunwayCondition.good :
                                                                    [
                                                                        BrakingConfiguration.maxManual :        (down: 35,    up: -30),
                                                                        BrakingConfiguration.autobrakeMax :     (down: 30,    up: -25),
                                                                        BrakingConfiguration.autobrakeFour :    (down: 5,     up: -5),
                                                                        BrakingConfiguration.autobrakeThree :   (down:  10,   up: -15),
                                                                        BrakingConfiguration.autobrakeTwo :     (down:  35,   up: -50),
                                                                        BrakingConfiguration.autobrakeOne :     (down:  60,   up: -65),
                                                                ],
                                                                RunwayCondition.goodToMedium :
                                                                    [
                                                                        BrakingConfiguration.maxManual :        (down: 60,    up: -50),
                                                                        BrakingConfiguration.autobrakeMax :     (down: 60,    up: -45),
                                                                        BrakingConfiguration.autobrakeFour :    (down: 40,    up: -30),
                                                                        BrakingConfiguration.autobrakeThree :   (down:  30,   up: -30),
                                                                        BrakingConfiguration.autobrakeTwo :     (down:  50,   up: -60),
                                                                        BrakingConfiguration.autobrakeOne :     (down:  70,   up: -70),
                                                                ],
                                                                RunwayCondition.medium :
                                                                    [
                                                                        BrakingConfiguration.maxManual :        (down: 85, up: -70),
                                                                        BrakingConfiguration.autobrakeMax :     (down: 85, up: -65),
                                                                        BrakingConfiguration.autobrakeFour :    (down: 75, up: -50),
                                                                        BrakingConfiguration.autobrakeThree :   (down: 50, up: -45),
                                                                        BrakingConfiguration.autobrakeTwo :     (down: 65, up: -70),
                                                                        BrakingConfiguration.autobrakeOne :     (down: 85, up: -80),
                                                                ],
                                                                RunwayCondition.mediumToPoor :
                                                                    [
                                                                        BrakingConfiguration.maxManual :        (down: 140, up: -100),
                                                                        BrakingConfiguration.autobrakeMax :     (down: 140, up: -100),
                                                                        BrakingConfiguration.autobrakeFour :    (down: 130, up: -90),
                                                                        BrakingConfiguration.autobrakeThree :   (down: 115, up: -80),
                                                                        BrakingConfiguration.autobrakeTwo :     (down: 120, up: -100),
                                                                        BrakingConfiguration.autobrakeOne :     (down: 135, up: -105),
                                                                ],
                                                                RunwayCondition.poor :
                                                                    [
                                                                        BrakingConfiguration.maxManual :        (down: 190, up: -130),
                                                                        BrakingConfiguration.autobrakeMax :     (down: 195, up: -130),
                                                                        BrakingConfiguration.autobrakeFour :    (down: 190, up: -130),
                                                                        BrakingConfiguration.autobrakeThree :   (down: 180, up: -115),
                                                                        BrakingConfiguration.autobrakeTwo :     (down: 180, up: -125),
                                                                        BrakingConfiguration.autobrakeOne :     (down: 185, up: -125),
                                                                ],
                                                                ],
                                                            tempAdjustment10DegreesC: [
                                                                RunwayCondition.dry :
                                                                    [
                                                                        BrakingConfiguration.maxManual :        (above: 25, below: -25),
                                                                        BrakingConfiguration.autobrakeMax :     (above: 35, below: -35),
                                                                        BrakingConfiguration.autobrakeFour :    (above: 45, below: -45),
                                                                        BrakingConfiguration.autobrakeThree :   (above: 65, below: -65),
                                                                        BrakingConfiguration.autobrakeTwo :     (above: 70, below: -70),
                                                                        BrakingConfiguration.autobrakeOne :     (above: 70, below: -70),
                                                                ],
                                                                RunwayCondition.good :
                                                                    [
                                                                        BrakingConfiguration.maxManual :        (above: 35, below: -35),
                                                                        BrakingConfiguration.autobrakeMax :     (above: 35, below: -40),
                                                                        BrakingConfiguration.autobrakeFour :    (above: 45, below: -45),
                                                                        BrakingConfiguration.autobrakeThree :   (above: 65, below: -65),
                                                                        BrakingConfiguration.autobrakeTwo :     (above: 70, below: -70),
                                                                        BrakingConfiguration.autobrakeOne :     (above: 70, below: -70),
                                                                ],
                                                                RunwayCondition.goodToMedium :
                                                                    [
                                                                        BrakingConfiguration.maxManual :        (above: 45, below: -45),
                                                                        BrakingConfiguration.autobrakeMax :     (above: 45, below: -45),
                                                                        BrakingConfiguration.autobrakeFour :    (above: 50, below: -50),
                                                                        BrakingConfiguration.autobrakeThree :   (above: 65, below: -65),
                                                                        BrakingConfiguration.autobrakeTwo :     (above: 70, below: -70),
                                                                        BrakingConfiguration.autobrakeOne :     (above: 70, below: -70),
                                                                ],
                                                                RunwayCondition.medium :
                                                                    [
                                                                        BrakingConfiguration.maxManual :        (above: 50, below: -50),
                                                                        BrakingConfiguration.autobrakeMax :     (above: 50, below: -50),
                                                                        BrakingConfiguration.autobrakeFour :    (above: 50, below: -60),
                                                                        BrakingConfiguration.autobrakeThree :   (above: 65, below: -65),
                                                                        BrakingConfiguration.autobrakeTwo :     (above: 70, below: -70),
                                                                        BrakingConfiguration.autobrakeOne :     (above: 70, below: -75),
                                                                ],
                                                                RunwayCondition.mediumToPoor :
                                                                    [
                                                                        BrakingConfiguration.maxManual :        (above: 60, below: -60),
                                                                        BrakingConfiguration.autobrakeMax :     (above: 60, below: -60),
                                                                        BrakingConfiguration.autobrakeFour :    (above: 60, below:-65),
                                                                        BrakingConfiguration.autobrakeThree :   (above: 65, below: -70),
                                                                        BrakingConfiguration.autobrakeTwo :     (above: 70, below: -70),
                                                                        BrakingConfiguration.autobrakeOne :     (above: 70, below: -80),
                                                                ],
                                                                RunwayCondition.poor :
                                                                    [
                                                                        BrakingConfiguration.maxManual :        (above: 65, below: -70),
                                                                        BrakingConfiguration.autobrakeMax :     (above: 65, below: -70),
                                                                        BrakingConfiguration.autobrakeFour :    (above: 65, below: -70),
                                                                        BrakingConfiguration.autobrakeThree :   (above: 70, below: -75),
                                                                        BrakingConfiguration.autobrakeTwo :     (above: 70, below: -75),
                                                                        BrakingConfiguration.autobrakeOne :     (above: 75, below: -80),
                                                                ],
                                                                ],
                                                            vrefAdjustmentPer5KtsAboveVref30: [
                                                                RunwayCondition.dry :
                                                                    [
                                                                        BrakingConfiguration.maxManual :        40,
                                                                        BrakingConfiguration.autobrakeMax :     75,
                                                                        BrakingConfiguration.autobrakeFour :    100,
                                                                        BrakingConfiguration.autobrakeThree :   110,
                                                                        BrakingConfiguration.autobrakeTwo :     100,
                                                                        BrakingConfiguration.autobrakeOne :     105
                                                                ],
                                                                RunwayCondition.good :
                                                                    [
                                                                        BrakingConfiguration.maxManual :        60,
                                                                        BrakingConfiguration.autobrakeMax :     70,
                                                                        BrakingConfiguration.autobrakeFour :    100,
                                                                        BrakingConfiguration.autobrakeThree :   110,
                                                                        BrakingConfiguration.autobrakeTwo :     100,
                                                                        BrakingConfiguration.autobrakeOne :     105,
                                                                ],
                                                                RunwayCondition.goodToMedium :
                                                                    [
                                                                        BrakingConfiguration.maxManual :        65,
                                                                        BrakingConfiguration.autobrakeMax :     75,
                                                                        BrakingConfiguration.autobrakeFour :    95,
                                                                        BrakingConfiguration.autobrakeThree :   110,
                                                                        BrakingConfiguration.autobrakeTwo :     100,
                                                                        BrakingConfiguration.autobrakeOne :     105,
                                                                ],
                                                                RunwayCondition.medium :
                                                                    [
                                                                        BrakingConfiguration.maxManual :        70,
                                                                        BrakingConfiguration.autobrakeMax :     80,
                                                                        BrakingConfiguration.autobrakeFour :    90,
                                                                        BrakingConfiguration.autobrakeThree :   110,
                                                                        BrakingConfiguration.autobrakeTwo :     100,
                                                                        BrakingConfiguration.autobrakeOne :     105,
                                                                ],
                                                                RunwayCondition.mediumToPoor :
                                                                    [
                                                                        BrakingConfiguration.maxManual :        75,
                                                                        BrakingConfiguration.autobrakeMax :     85,
                                                                        BrakingConfiguration.autobrakeFour :    85,
                                                                        BrakingConfiguration.autobrakeThree :   105,
                                                                        BrakingConfiguration.autobrakeTwo :     95,
                                                                        BrakingConfiguration.autobrakeOne :     100,
                                                                ],
                                                                RunwayCondition.poor :
                                                                    [
                                                                        BrakingConfiguration.maxManual :        80,
                                                                        BrakingConfiguration.autobrakeMax :     85,
                                                                        BrakingConfiguration.autobrakeFour :    80,
                                                                        BrakingConfiguration.autobrakeThree :   105,
                                                                        BrakingConfiguration.autobrakeTwo :     90,
                                                                        BrakingConfiguration.autobrakeOne :     100,
                                                                ],
                                                                ],
                                                            reverseThrustAdjustment: [
                                                                RunwayCondition.dry :
                                                                    [
                                                                        BrakingConfiguration.maxManual :        (one: 25,    none: 50),
                                                                        BrakingConfiguration.autobrakeMax :     (one: 0,     none: 0),
                                                                        BrakingConfiguration.autobrakeFour :    (one: 0,     none: 0),
                                                                        BrakingConfiguration.autobrakeThree :   (one: 0,     none: 0),
                                                                        BrakingConfiguration.autobrakeTwo :     (one: 60,    none: 60),
                                                                        BrakingConfiguration.autobrakeOne :     (one: 195,   none: 205),
                                                                ],
                                                                RunwayCondition.good :
                                                                    [
                                                                        BrakingConfiguration.maxManual :        (one: 90,     none: 225),
                                                                        BrakingConfiguration.autobrakeMax :     (one: 100,    none: 235),
                                                                        BrakingConfiguration.autobrakeFour :    (one: 10,     none: 50),
                                                                        BrakingConfiguration.autobrakeThree :   (one: 0,      none: 0),
                                                                        BrakingConfiguration.autobrakeTwo :     (one: 60,     none: 60),
                                                                        BrakingConfiguration.autobrakeOne :     (one: 195,    none: 205),
                                                                ],
                                                                RunwayCondition.goodToMedium :
                                                                    [
                                                                        BrakingConfiguration.maxManual :        (one: 180,     none: 460),
                                                                        BrakingConfiguration.autobrakeMax :     (one: 180,     none: 460),
                                                                        BrakingConfiguration.autobrakeFour :    (one: 130,     none: 370),
                                                                        BrakingConfiguration.autobrakeThree :   (one: 65,      none: 245),
                                                                        BrakingConfiguration.autobrakeTwo :     (one: 95,      none: 225),
                                                                        BrakingConfiguration.autobrakeOne :     (one: 220,     none: 315),
                                                                ],
                                                                RunwayCondition.medium :
                                                                    [
                                                                        BrakingConfiguration.maxManual :        (one: 265,     none: 695),
                                                                        BrakingConfiguration.autobrakeMax :     (one: 260,     none: 685),
                                                                        BrakingConfiguration.autobrakeFour :    (one: 245,     none: 690),
                                                                        BrakingConfiguration.autobrakeThree :   (one: 125,     none: 495),
                                                                        BrakingConfiguration.autobrakeTwo :     (one: 130,     none: 395),
                                                                        BrakingConfiguration.autobrakeOne :     (one: 240,     none: 425),
                                                                ],
                                                                RunwayCondition.mediumToPoor :
                                                                    [
                                                                        BrakingConfiguration.maxManual :        (one: 425,     none: 1265),
                                                                        BrakingConfiguration.autobrakeMax :     (one: 425,     none: 1260),
                                                                        BrakingConfiguration.autobrakeFour :    (one: 420,     none: 1270),
                                                                        BrakingConfiguration.autobrakeThree :   (one: 330,     none: 1145),
                                                                        BrakingConfiguration.autobrakeTwo :     (one: 305,     none: 1050),
                                                                        BrakingConfiguration.autobrakeOne :     (one: 390,     none: 1035),
                                                                ],
                                                                RunwayCondition.poor :
                                                                    [
                                                                        BrakingConfiguration.maxManual :        (one: 585,     none: 1835),
                                                                        BrakingConfiguration.autobrakeMax :     (one: 585,     none: 1840),
                                                                        BrakingConfiguration.autobrakeFour :    (one: 590,     none: 1850),
                                                                        BrakingConfiguration.autobrakeThree :   (one: 535,     none: 1800),
                                                                        BrakingConfiguration.autobrakeTwo :     (one: 475,     none: 1700),
                                                                        BrakingConfiguration.autobrakeOne :     (one: 535,     none: 1645),
                                                                ]
                    ])
            ]
        
    ]
    
    static func getPerformanceDataFor(variant: AircraftType, flapSetting: FlapSetting) -> LandingPerformanceData {
        return self.performanceDictionary[variant]![flapSetting]!
    }
    
    
}
