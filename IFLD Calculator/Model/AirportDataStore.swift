//
//  AirportDataStore.swift
//
//  This class is a singleton used to manage stored Airport data on Firebase database.
//
//  IFLD Calculator
//
//  Created by Adam Zemmoura on 04/03/2019.
//  Copyright © 2019 Adam Zemmoura. All rights reserved.
//

import Foundation
import Firebase
import CodableFirebase

protocol AirportDataStoreDelegate {
    func airportDataStoreDidUpdate(airports: [Airport])
}

class AirportDataStore {
    
    struct FirebaseDatabaseKey {
        static let airports = "airports"
    }

    static let shared = AirportDataStore()
    
    var delegate: AirportDataStoreDelegate? = nil {
        didSet {
            // make sure the data is in sync when delegate first assigned
            print("About to send this to the delegate : ", _airports)
            delegate?.airportDataStoreDidUpdate(airports: _airports)
        }
    }
    
    private var _airports = [Airport]() {
        didSet {
            // sort them alphabetically
            _airports = _airports.sorted(by: {$0.getName() < $1.getName() })
            
            // update delegate each time the airports data changes 
            delegate?.airportDataStoreDidUpdate(airports: _airports)
        }
    }
    private let databaseReference : DatabaseReference!
    private var databaseHandle : DatabaseHandle!
    
    private init() {
        
        // setup the firebase database
        databaseReference = Database.database().reference()
        databaseHandle = databaseReference.child(FirebaseDatabaseKey.airports).observe(.value) { (snapshot) in
            
            print("Database listener fired")
            // check there is a value in the snapshot
            guard let airportsDict = snapshot.value as? [String : Any] else {
                print("There is no data at path /\(FirebaseDatabaseKey.airports)")
                return
            }
            
            // try to decode the data in the snapshot into an array of Airport objects
            self._airports = [] // ensure array starts off empty to avoid duplicates
            for airportData in airportsDict.values {
                do {
                    let airport = try FirebaseDecoder().decode(Airport.self, from: airportData)
                    self._airports.append(airport)
                    
                } catch {
                    print("something went wrong trying to decode database")
                    print(error)
                }
            }
            
            
        }
        
    }
    
    deinit {
        // stop listening for updates
        databaseReference.removeObserver(withHandle: databaseHandle)
    }
    
    /**
    *   Attemps to add a new Airport to the database but only if the airport has not already been added.
    *   ICAO code (unique) & name is used to determine whether the Airport has already been added
    *
    *   @param : airport - the Airport to add
    *   @return : Bool - true if the Airport was sucessfully added, false if not.
    */
    func addAirport(airport: Airport) -> Bool {
        
        let alreadyAdded = _airports.contains(where: {$0.getCode() == airport.getCode() || $0.getName() == airport.getName() })
        
        if alreadyAdded {
            print("The airport with that ICAO code or name has already been added.")
            return false
        }
        
        // the Airport has not been added previously, so add it now
        do {
            let airportData = try FirebaseEncoder().encode(airport)
            let airportsKey = FirebaseDatabaseKey.airports
            let airportKey = airport.getName().lowercased()
            databaseReference.child("\(airportsKey)/\(airportKey)").setValue(airportData)
        } catch {
            print(error)
            return false
        }
        
        return true
        
    }
    
//    private func addTestData() {
//        
//        let heathrow = Airport(name: "Heathrow", icaoCode: "egll", runways: [
//                Runway(name: "27L", distanceMeters: 3000, slope: 0.0, elevationFeet: 80),
//                Runway(name: "27R", distanceMeters: 3100, slope: 0.0, elevationFeet: 80)
//            ])
//        let gatwick = Airport(name: "Gatwick", icaoCode: "egkk", runways: [
//            Runway(name: "08R", distanceMeters: 2500, slope: 0.0, elevationFeet: 80),
//            Runway(name: "26L", distanceMeters: 2500, slope: 0.0, elevationFeet: 80)
//            ])
//        
//        let _ = addAirport(airport: heathrow)
//        let _ = addAirport(airport: gatwick)
//        
//    }
    
}
