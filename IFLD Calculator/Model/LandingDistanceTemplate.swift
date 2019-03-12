//
//  LandingDistanceTemplate.swift
//  IFLD Calculator
//
//  Created by Adam Zemmoura on 11/03/2019.
//  Copyright © 2019 Adam Zemmoura. All rights reserved.
//

import Foundation
/*
let performanceDictionary : [AircraftType : [FlapSetting : LandingPerformanceData] ] = [
    AircraftType.B777_200_GE90_76B :
[
FlapSetting.twentyFive : LandingPerformanceData(title: "Normal Configuration Landing Distance Flaps 25 (777-200/GE90-76B)",
flapSetting: .twentyFive,
referenceDistances_200T: [
RunwayCondition.dry :
[
BrakingConfiguration.maxManual : ,
BrakingConfiguration.autobrakeMax : ,
BrakingConfiguration.autobrakeFour : ,
BrakingConfiguration.autobrakeThree : ,
BrakingConfiguration.autobrakeTwo : ,
BrakingConfiguration.autobrakeOne :

],
RunwayCondition.good :
[
BrakingConfiguration.maxManual : ,
BrakingConfiguration.autobrakeMax : ,
BrakingConfiguration.autobrakeFour : ,
BrakingConfiguration.autobrakeThree : ,
BrakingConfiguration.autobrakeTwo : ,
BrakingConfiguration.autobrakeOne :

],
RunwayCondition.goodToMedium :
[
BrakingConfiguration.maxManual :  ,
BrakingConfiguration.autobrakeMax :  ,
BrakingConfiguration.autobrakeFour :  ,
BrakingConfiguration.autobrakeThree :  ,
BrakingConfiguration.autobrakeTwo :  ,
BrakingConfiguration.autobrakeOne : ,

],
RunwayCondition.medium :
[
BrakingConfiguration.maxManual :  ,
BrakingConfiguration.autobrakeMax :  ,
BrakingConfiguration.autobrakeFour :  ,
BrakingConfiguration.autobrakeThree :  ,
BrakingConfiguration.autobrakeTwo :  ,
BrakingConfiguration.autobrakeOne : ,

],
RunwayCondition.mediumToPoor :
[
BrakingConfiguration.maxManual :  ,
BrakingConfiguration.autobrakeMax :  ,
BrakingConfiguration.autobrakeFour :  ,
BrakingConfiguration.autobrakeThree :  ,
BrakingConfiguration.autobrakeTwo :  ,
BrakingConfiguration.autobrakeOne : ,

],
RunwayCondition.poor :
[
BrakingConfiguration.maxManual :  ,
BrakingConfiguration.autobrakeMax :  ,
BrakingConfiguration.autobrakeFour :  ,
BrakingConfiguration.autobrakeThree :  ,
BrakingConfiguration.autobrakeTwo :  ,
BrakingConfiguration.autobrakeOne : ,

]
],
weightAdjustmentPer5Tonne: [
RunwayCondition.dry :
[
BrakingConfiguration.maxManual : (above: , below: ),
BrakingConfiguration.autobrakeMax : (above: , below: ),
BrakingConfiguration.autobrakeFour : (above: , below:  ),
BrakingConfiguration.autobrakeThree : (above: , below:  ),
BrakingConfiguration.autobrakeTwo : (above: , below:  ),
BrakingConfiguration.autobrakeOne : (above: , below:  ),
],
RunwayCondition.good :
[
BrakingConfiguration.maxManual : (above: , below: ),
BrakingConfiguration.autobrakeMax : (above: , below: ),
BrakingConfiguration.autobrakeFour : (above: , below:),
BrakingConfiguration.autobrakeThree : (above: , below: ),
BrakingConfiguration.autobrakeTwo : (above: , below: ),
BrakingConfiguration.autobrakeOne : (above: , below: ),
],
RunwayCondition.goodToMedium :
[
BrakingConfiguration.maxManual : (above: , below: ),
BrakingConfiguration.autobrakeMax : (above: , below: ),
BrakingConfiguration.autobrakeFour : (above: , below: ),
BrakingConfiguration.autobrakeThree : (above: , below: ),
BrakingConfiguration.autobrakeTwo : (above: , below: ),
BrakingConfiguration.autobrakeOne : (above: , below: ),
],
RunwayCondition.medium :
[
BrakingConfiguration.maxManual : (above: , below: ),
BrakingConfiguration.autobrakeMax : (above: , below: ),
BrakingConfiguration.autobrakeFour : (above: , below: ),
BrakingConfiguration.autobrakeThree : (above: , below: ),
BrakingConfiguration.autobrakeTwo : (above: , below: ),
BrakingConfiguration.autobrakeOne : (above: , below: ),
],
RunwayCondition.mediumToPoor :
[
BrakingConfiguration.maxManual : (above: , below: ),
BrakingConfiguration.autobrakeMax : (above: , below: ),
BrakingConfiguration.autobrakeFour : (above: , below: ),
BrakingConfiguration.autobrakeThree : (above: , below: ),
BrakingConfiguration.autobrakeTwo : (above: , below: ),
BrakingConfiguration.autobrakeOne : (above: , below: ),
],
RunwayCondition.poor :
[
BrakingConfiguration.maxManual : (above: , below: ),
BrakingConfiguration.autobrakeMax : (above: , below: ),
BrakingConfiguration.autobrakeFour : (above: , below: ),
BrakingConfiguration.autobrakeThree : (above: , below: ),
BrakingConfiguration.autobrakeTwo : (above: , below: ),
BrakingConfiguration.autobrakeOne : (above: , below: ),
],
],
altitudeAdjustmentPer1000FT: [
RunwayCondition.dry :
[
BrakingConfiguration.maxManual : ,
BrakingConfiguration.autobrakeMax : ,
BrakingConfiguration.autobrakeFour : ,
BrakingConfiguration.autobrakeThree : ,
BrakingConfiguration.autobrakeTwo : ,
BrakingConfiguration.autobrakeOne : ,
],
RunwayCondition.good :
[
BrakingConfiguration.maxManual : ,
BrakingConfiguration.autobrakeMax : ,
BrakingConfiguration.autobrakeFour : ,
BrakingConfiguration.autobrakeThree : ,
BrakingConfiguration.autobrakeTwo : ,
BrakingConfiguration.autobrakeOne : ,
],
RunwayCondition.goodToMedium :
[
BrakingConfiguration.maxManual : ,
BrakingConfiguration.autobrakeMax : ,
BrakingConfiguration.autobrakeFour : ,
BrakingConfiguration.autobrakeThree : ,
BrakingConfiguration.autobrakeTwo : ,
BrakingConfiguration.autobrakeOne : ,
],
RunwayCondition.medium :
[
BrakingConfiguration.maxManual : ,
BrakingConfiguration.autobrakeMax : ,
BrakingConfiguration.autobrakeFour : ,
BrakingConfiguration.autobrakeThree : ,
BrakingConfiguration.autobrakeTwo : ,
BrakingConfiguration.autobrakeOne : ,
],
RunwayCondition.mediumToPoor :
[
BrakingConfiguration.maxManual : ,
BrakingConfiguration.autobrakeMax : ,
BrakingConfiguration.autobrakeFour : ,
BrakingConfiguration.autobrakeThree : ,
BrakingConfiguration.autobrakeTwo : ,
BrakingConfiguration.autobrakeOne : ,
],
RunwayCondition.poor :
[
BrakingConfiguration.maxManual : ,
BrakingConfiguration.autobrakeMax : ,
BrakingConfiguration.autobrakeFour : ,
BrakingConfiguration.autobrakeThree : ,
BrakingConfiguration.autobrakeTwo : ,
BrakingConfiguration.autobrakeOne : ,
],
],
windAdjustmentPer10KTS: [
RunwayCondition.dry :
[
BrakingConfiguration.maxManual : (head: , tail: ),
BrakingConfiguration.autobrakeMax : (head: , tail: ),
BrakingConfiguration.autobrakeFour : (head: , tail: ),
BrakingConfiguration.autobrakeThree : (head:  , tail: ),
BrakingConfiguration.autobrakeTwo : (head:  , tail: ),
BrakingConfiguration.autobrakeOne : (head:  , tail: ),
],
RunwayCondition.good :
[
BrakingConfiguration.maxManual : (head: , tail: ),
BrakingConfiguration.autobrakeMax : (head: , tail: ),
BrakingConfiguration.autobrakeFour : (head: , tail: ),
BrakingConfiguration.autobrakeThree : (head:  , tail: ),
BrakingConfiguration.autobrakeTwo : (head:  , tail: ),
BrakingConfiguration.autobrakeOne : (head:  , tail: ),
],
RunwayCondition.goodToMedium :
[
BrakingConfiguration.maxManual : (head: , tail: ),
BrakingConfiguration.autobrakeMax : (head: , tail: ),
BrakingConfiguration.autobrakeFour : (head: , tail: ),
BrakingConfiguration.autobrakeThree : (head:  , tail: ),
BrakingConfiguration.autobrakeTwo : (head:  , tail: ),
BrakingConfiguration.autobrakeOne : (head:  , tail: ),
],
RunwayCondition.medium :
[
BrakingConfiguration.maxManual : (head: , tail: ),
BrakingConfiguration.autobrakeMax : (head: , tail: ),
BrakingConfiguration.autobrakeFour : (head: , tail: ),
BrakingConfiguration.autobrakeThree : (head: , tail: ),
BrakingConfiguration.autobrakeTwo : (head: , tail: ),
BrakingConfiguration.autobrakeOne : (head: , tail: ),
],
RunwayCondition.mediumToPoor :
[
BrakingConfiguration.maxManual : (head: , tail: ),
BrakingConfiguration.autobrakeMax : (head: , tail: ),
BrakingConfiguration.autobrakeFour : (head: , tail: ),
BrakingConfiguration.autobrakeThree : (head: , tail: ),
BrakingConfiguration.autobrakeTwo : (head: , tail: ),
BrakingConfiguration.autobrakeOne : (head: , tail: ),
],
RunwayCondition.poor :
[
BrakingConfiguration.maxManual : (head: , tail: ),
BrakingConfiguration.autobrakeMax : (head: , tail: ),
BrakingConfiguration.autobrakeFour : (head: , tail: ),
BrakingConfiguration.autobrakeThree : (head: , tail: ),
BrakingConfiguration.autobrakeTwo : (head: , tail: ),
BrakingConfiguration.autobrakeOne : (head: , tail: ),
],
],
slopeAdjustmentPer1Percent: [
RunwayCondition.dry :
[
BrakingConfiguration.maxManual : (down:  , up:  ),
BrakingConfiguration.autobrakeMax : (down: , up ),
BrakingConfiguration.autobrakeFour : (down: , up: ),
BrakingConfiguration.autobrakeThree : (down:  , up:  ),
BrakingConfiguration.autobrakeTwo : (down:  , up:  ),
BrakingConfiguration.autobrakeOne : (down:  , up:  ),
],
RunwayCondition.good :
[
BrakingConfiguration.maxManual : (down:  , up: ),
BrakingConfiguration.autobrakeMax : (down:  , up: ),
BrakingConfiguration.autobrakeFour : (down: , up:),
BrakingConfiguration.autobrakeThree : (down:  , up: ),
BrakingConfiguration.autobrakeTwo : (down:  , up: ),
BrakingConfiguration.autobrakeOne : (down:  , up: ),
],
RunwayCondition.goodToMedium :
[
BrakingConfiguration.maxManual : (down: , up: ),
BrakingConfiguration.autobrakeMax : (down: , up: ),
BrakingConfiguration.autobrakeFour : (down: , up: ),
BrakingConfiguration.autobrakeThree : (down: , up: ),
BrakingConfiguration.autobrakeTwo : (down: , up: ),
BrakingConfiguration.autobrakeOne : (down: , up: ),
],
RunwayCondition.medium :
[
BrakingConfiguration.maxManual : (down: , up: ),
BrakingConfiguration.autobrakeMax : (down: , up: ),
BrakingConfiguration.autobrakeFour : (down: , up: ),
BrakingConfiguration.autobrakeThree : (down: , up: ),
BrakingConfiguration.autobrakeTwo : (down: , up: ),
BrakingConfiguration.autobrakeOne : (down: , up: ),
],
RunwayCondition.mediumToPoor :
[
BrakingConfiguration.maxManual : (down: , up: -),
BrakingConfiguration.autobrakeMax : (down: , up: -),
BrakingConfiguration.autobrakeFour : (down: , up: ),
BrakingConfiguration.autobrakeThree : (down: , up: ),
BrakingConfiguration.autobrakeTwo : (down: , up: ),
BrakingConfiguration.autobrakeOne : (down: , up: ),
],
RunwayCondition.poor :
[
BrakingConfiguration.maxManual : (down: , up: ),
BrakingConfiguration.autobrakeMax : (down: , up: ),
BrakingConfiguration.autobrakeFour : (down: , up: ),
BrakingConfiguration.autobrakeThree : (down: , up: ),
BrakingConfiguration.autobrakeTwo : (down: , up: ),
BrakingConfiguration.autobrakeOne : (down: , up: ),
],
],
tempAdjustmentPer10DegreesC: [
RunwayCondition.dry :
[
BrakingConfiguration.maxManual : (above: , below: ),
BrakingConfiguration.autobrakeMax : (above: , below: ),
BrakingConfiguration.autobrakeFour : (above: , below: ),
BrakingConfiguration.autobrakeThree : (above: , below: ),
BrakingConfiguration.autobrakeTwo : (above: , below: ),
BrakingConfiguration.autobrakeOne : (above: , below: ),
],
RunwayCondition.good :
[
BrakingConfiguration.maxManual : (above: , below: ),
BrakingConfiguration.autobrakeMax : (above: , below: ),
BrakingConfiguration.autobrakeFour : (above: , below: ),
BrakingConfiguration.autobrakeThree : (above: , below: ),
BrakingConfiguration.autobrakeTwo : (above: , below: ),
BrakingConfiguration.autobrakeOne : (above: , below: ),
],
RunwayCondition.goodToMedium :
[
BrakingConfiguration.maxManual : (above: , below: ),
BrakingConfiguration.autobrakeMax : (above: , below: ),
BrakingConfiguration.autobrakeFour : (above: , below: ),
BrakingConfiguration.autobrakeThree : (above: , below: ),
BrakingConfiguration.autobrakeTwo : (above: , below: ),
BrakingConfiguration.autobrakeOne : (above: , below: ),
],
RunwayCondition.medium :
[
BrakingConfiguration.maxManual : (above: , below: ),
BrakingConfiguration.autobrakeMax : (above: , below: ),
BrakingConfiguration.autobrakeFour : (above: , below: ),
BrakingConfiguration.autobrakeThree : (above: , below: ),
BrakingConfiguration.autobrakeTwo : (above: , below: ),
BrakingConfiguration.autobrakeOne : (above: , below: ),
],
RunwayCondition.mediumToPoor :
[
BrakingConfiguration.maxManual : (above: , below: ),
BrakingConfiguration.autobrakeMax : (above: , below: ),
BrakingConfiguration.autobrakeFour : (above: , below: ),
BrakingConfiguration.autobrakeThree : (above: , below: ),
BrakingConfiguration.autobrakeTwo : (above: , below: ),
BrakingConfiguration.autobrakeOne : (above: , below: ),
],
RunwayCondition.poor :
[
BrakingConfiguration.maxManual : (above: , below: ),
BrakingConfiguration.autobrakeMax : (above: , below: ),
BrakingConfiguration.autobrakeFour : (above: , below: ),
BrakingConfiguration.autobrakeThree : (above: , below: ),
BrakingConfiguration.autobrakeTwo : (above: , below: ),
BrakingConfiguration.autobrakeOne : (above: , below: ),
],
],
vrefAdjustmentPer5KtsAboveVref30: [
RunwayCondition.dry :
[
BrakingConfiguration.maxManual : ,
BrakingConfiguration.autobrakeMax : ,
BrakingConfiguration.autobrakeFour : ,
BrakingConfiguration.autobrakeThree :  ,
BrakingConfiguration.autobrakeTwo :  ,
BrakingConfiguration.autobrakeOne :
],
RunwayCondition.good :
[
BrakingConfiguration.maxManual : ,
BrakingConfiguration.autobrakeMax : ,
BrakingConfiguration.autobrakeFour : ,
BrakingConfiguration.autobrakeThree :  ,
BrakingConfiguration.autobrakeTwo :  ,
BrakingConfiguration.autobrakeOne :
],
RunwayCondition.goodToMedium :
[
BrakingConfiguration.maxManual : ,
BrakingConfiguration.autobrakeMax : ,
BrakingConfiguration.autobrakeFour : ,
BrakingConfiguration.autobrakeThree :  ,
BrakingConfiguration.autobrakeTwo :  ,
BrakingConfiguration.autobrakeOne : ,
],
RunwayCondition.medium :
[
BrakingConfiguration.maxManual : ,
BrakingConfiguration.autobrakeMax : ,
BrakingConfiguration.autobrakeFour : ,
BrakingConfiguration.autobrakeThree :  ,
BrakingConfiguration.autobrakeTwo :  ,
BrakingConfiguration.autobrakeOne : ,
],
RunwayCondition.mediumToPoor :
[
BrakingConfiguration.maxManual : ,
BrakingConfiguration.autobrakeMax : ,
BrakingConfiguration.autobrakeFour : ,
BrakingConfiguration.autobrakeThree :  ,
BrakingConfiguration.autobrakeTwo :  ,
BrakingConfiguration.autobrakeOne : ,
],
RunwayCondition.poor :
[
BrakingConfiguration.maxManual : ,
BrakingConfiguration.autobrakeMax : ,
BrakingConfiguration.autobrakeFour : ,
BrakingConfiguration.autobrakeThree :  ,
BrakingConfiguration.autobrakeTwo :  ,
BrakingConfiguration.autobrakeOne : ,
],
],
reverseThrustAdjustment: [
RunwayCondition.dry :
[
BrakingConfiguration.maxManual : (one:  , none: ),
BrakingConfiguration.autobrakeMax : (one: , none: ),
BrakingConfiguration.autobrakeFour : (one: , none: ),
BrakingConfiguration.autobrakeThree : (one: , none: ),
BrakingConfiguration.autobrakeTwo : (one:  , none: ),
BrakingConfiguration.autobrakeOne : (one: , none: ),
],
RunwayCondition.good :
[
BrakingConfiguration.maxManual : (one: , none: ),
BrakingConfiguration.autobrakeMax : (one: , none: ),
BrakingConfiguration.autobrakeFour : (one:, none: ),
BrakingConfiguration.autobrakeThree : (one: , none:),
BrakingConfiguration.autobrakeTwo : (one: , none: ),
BrakingConfiguration.autobrakeOne : (one: , none: ),
],
RunwayCondition.goodToMedium :
[
BrakingConfiguration.maxManual : (one: , none: ),
BrakingConfiguration.autobrakeMax : (one: , none: ),
BrakingConfiguration.autobrakeFour : (one: , none: ),
BrakingConfiguration.autobrakeThree : (one: , none: ),
BrakingConfiguration.autobrakeTwo : (one: , none: ),
BrakingConfiguration.autobrakeOne : (one: , none: ),
],
RunwayCondition.medium :
[
BrakingConfiguration.maxManual : (one: , none: ),
BrakingConfiguration.autobrakeMax : (one: , none: ),
BrakingConfiguration.autobrakeFour : (one: , none: ),
BrakingConfiguration.autobrakeThree : (one: , none: ),
BrakingConfiguration.autobrakeTwo : (one: , none: ),
BrakingConfiguration.autobrakeOne : (one: , none: ),
],
RunwayCondition.mediumToPoor :

BrakingConfiguration.maxManual : (one: , none: ),
BrakingConfiguration.autobrakeMax : (one: , none: ),
BrakingConfiguration.autobrakeFour : (one: , none: ),
BrakingConfiguration.autobrakeThree : (one: , none: ),
BrakingConfiguration.autobrakeTwo : (one: , none: ),
BrakingConfiguration.autobrakeOne : (one: , none: ),
],
RunwayCondition.poor :
[
BrakingConfiguration.maxManual : (one: , none: ),
BrakingConfiguration.autobrakeMax : (one: , none: ),
BrakingConfiguration.autobrakeFour : (one: , none: ),
BrakingConfiguration.autobrakeThree : (one: , none: ),
BrakingConfiguration.autobrakeTwo : (one: , none: ),
BrakingConfiguration.autobrakeOne : (one: , none: ),
]
])*/
