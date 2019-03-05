//
//  ViewController.swift
//  IFLD Calculator
//
//  Created by Adam Zemmoura on 28/02/2019.
//  Copyright © 2019 Adam Zemmoura. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK:- Properties
    private var airports = [Airport]() {
        didSet {
            // update the airports picker
            airportPicker.reloadAllComponents()
            airportSelectionTableView.reloadData()
        }
    }
    private var selectedAirport: Airport? = nil {
        didSet {
            // every time the selected airport changes, update the runways to correspond
            runwayPicker.reloadAllComponents()
            runwayPicker.selectRow(0, inComponent: 0, animated: true)
            airportTextField.text = selectedAirport?.getName()
        }
    }
    
    private struct TableviewCellIdentifiers {
        static let variantCell = "variantTableViewCell"
        static let airportCell = "airportTableViewCell"
    }

    
    // MARK:- Outlets
    @IBOutlet weak var flapSelectionSegmentedControl: UISegmentedControl!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var reverseThrustSegmentedControl: UISegmentedControl!
    @IBOutlet weak var variantSelectionTextField: UITextField! {
        didSet {
            variantSelectionTextField.delegate = self
        }
    }
    
    @IBOutlet weak var variantSelectionTableView: UITableView! {
        didSet {
            variantSelectionTableView.isHidden = true
            variantSelectionTableView.dataSource = self
            variantSelectionTableView.delegate = self
        }
    }
    
    @IBOutlet weak var aircraftInputBorderView : UIView! {
        didSet {
            applyBorderStyles(view: aircraftInputBorderView)
        }
    }

    @IBOutlet weak var weatherInputBorderView: UIView! {
        didSet {
            applyBorderStyles(view: weatherInputBorderView)
        }
    }
    
    @IBOutlet weak var airportInputBorderView: UIView! {
        didSet {
            applyBorderStyles(view: airportInputBorderView)
        }
    }
    
    @IBOutlet weak var windPicker: UIPickerView! {
        didSet {
            // set the middle of the picker data set as default
            let initialRow = windPicker.dataSource!.pickerView(windPicker, numberOfRowsInComponent: 0) / 2
            windPicker.selectRow(initialRow-1, inComponent: 0, animated: false)
            
        }
    }
    @IBOutlet weak var tempPicker: UIPickerView! {
        didSet {
            // set inital temperature to ISA at sea level ie. 15ºC
            if let initialRow = WeatherInputData.temperatureData.firstIndex(of: 15) {
                tempPicker.selectRow(initialRow, inComponent: 0, animated: false)
            }
        }
    }
    @IBOutlet weak var brakingActionPicker: UIPickerView!
    
    @IBOutlet weak var airportPicker: UIPickerView! {
        didSet {
            airportPicker.delegate = self
            airportPicker.dataSource = self
        }
    }
    
    @IBOutlet weak var runwayPicker: UIPickerView! {
        didSet {
            runwayPicker.delegate = self
            runwayPicker.dataSource = self
        }
    }
    
    @IBOutlet weak var airportTextField: UITextField! {
        didSet {
            airportTextField.delegate = self
        }
    }
    
    @IBOutlet weak var airportSelectionTableView: UITableView! {
        didSet {
            airportSelectionTableView.dataSource = self
            airportSelectionTableView.delegate = self
            airportSelectionTableView.isHidden = true
        }
    }
    
    
    
    
    // MARK:- Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set delegate on AirportDataStore to subscribe to updates on airports data model
        AirportDataStore.shared.delegate = self
        
    }

    // MARK:- Helper Methods
    private func toggleViewIsHidden(view: UIView) {
        view.isHidden = !view.isHidden
    }
    
    private func applyBorderStyles(view: UIView) {
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
    }

}
// MARK:- UITextFieldDelegate
extension ViewController : UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        if textField == variantSelectionTextField {
            toggleViewIsHidden(view: variantSelectionTableView)
            return false
        }
        
        if textField == airportTextField {
            toggleViewIsHidden(view: airportSelectionTableView)
            selectedAirport = nil
            return true
        }
        
        return true
    }
    
}

// MARK:- UITableViewDelegate
extension ViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if tableView == variantSelectionTableView {
            let selectedVariant = AircraftType.options[indexPath.row].rawValue
            tableView.deselectRow(at: indexPath, animated: true)
            toggleViewIsHidden(view: variantSelectionTableView)
            variantSelectionTextField.text = selectedVariant
        }
        else if tableView == airportSelectionTableView {
            selectedAirport = airports[indexPath.row]
            toggleViewIsHidden(view: airportSelectionTableView)
            airportTextField.resignFirstResponder()
        }
        
    }
    
}

// MARK:- UITableViewDataSource
extension ViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView == variantSelectionTableView {
            return AircraftType.options.count
        }
        
        if tableView == airportSelectionTableView {
            return airports.count
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = UITableViewCell()
        var titleText = ""
        var detailText = ""
        
        if tableView == airportSelectionTableView {
            cell = tableView.dequeueReusableCell(withIdentifier: TableviewCellIdentifiers.airportCell, for: indexPath)
            let airport = airports[indexPath.row]
            titleText = airport.getName()
            detailText = airport.getCode()
        }
        else if tableView == variantSelectionTableView {
            cell = tableView.dequeueReusableCell(withIdentifier: TableviewCellIdentifiers.variantCell, for: indexPath)
            let variant = AircraftType.options[indexPath.row]
            titleText = variant.rawValue
            detailText = AircraftType.engineVariant(aircraftType: variant)
        }
        
        cell.textLabel?.text = titleText
        cell.detailTextLabel?.text = detailText
        
        return cell
    }
    
}

// MARK:- UIPickerViewDataSource
extension ViewController : UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        if pickerView == windPicker {
            return 2
        }
        
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        // wind direction
        if pickerView == windPicker && component == 0 {
            return WeatherInputData.windDirectionData.count
        }
        
        // wind speed
        if pickerView == windPicker && component == 1 {
            return WeatherInputData.windSpeedData.count
        }
        
        // temperature
        if pickerView == tempPicker {
            return WeatherInputData.temperatureData.count
        }
        
        // braking action
        if pickerView == brakingActionPicker {
            return RunwayCondition.options.count
        }
        
        // airport
        if pickerView == airportPicker {
            if airports.count > 0 {
                return airports.count
            }
            return 1 // to allow for default text in picker view
        }
        
        // runways
        if pickerView == runwayPicker {
            if let selectedAirport = selectedAirport {
                return selectedAirport.getRunways().count
            } else {
                return 1
            }
        }
        
        return 0
    }
    
    
    
    
}

// MARK:- UIPickerViewDelegate
extension ViewController : UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        // wind direction
        if pickerView == windPicker && component == 0 {
            var windDirection = String(WeatherInputData.windDirectionData[row])
            if windDirection.count == 2 {
                windDirection = "0\(windDirection)"
            }
            return windDirection
        }
        
        // wind speed
        if pickerView == windPicker && component == 1 {
            return String(WeatherInputData.windSpeedData[row])
        }
        
        // temperature
        if pickerView == tempPicker {
            return "\(WeatherInputData.temperatureData[row])ºC"
        }
        
        // braking action
        if pickerView == brakingActionPicker {
            return RunwayCondition.options[row].rawValue
        }
        
        // airport
        if pickerView == airportPicker {
            if airports.count > 0 {
                return airports[row].getName()
            }
            return "Select"
        }
        
        // runways at airport
        if pickerView == runwayPicker {
            
            // check there is a selectedAirport and get the airport and runways if so
            if let selectedAirport = selectedAirport {
                let runways = selectedAirport.getRunways()
                return runways[row].getName()
            } else {
                return "----"
            }
            
        }
        
        return "Test"
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if pickerView == airportPicker {
            selectedAirport = airports[row]
        }
    }
    
}

// MARK:- AirportDataStoreDelegate
extension ViewController: AirportDataStoreDelegate {
    
    func airportDataStoreDidUpdate(airports: [Airport]) {
        print("DELEGATE RECEIVED AIRPORTS FROM DATA SOURCE")
        self.airports = airports
    }
    
}

