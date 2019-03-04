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
    private let variants = ["777-200", "777-300", "777-900"]
    
    private struct TableviewCellIdentifiers {
        static let variantCell = "variantTableViewCell"
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
    
    
    
    
    
    
    // MARK:- Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    // MARK:- Helper Methods
    private func toggleVariantSelectionTableView() {
        variantSelectionTableView.isHidden = !variantSelectionTableView.isHidden
    }

    private func applyBorderStyles(view: UIView) {
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
    }

}

extension ViewController : UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        if textField == variantSelectionTextField {
            toggleVariantSelectionTableView()
            return false
        }
        
        return true
    }
    
}

extension ViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedVariant = AircraftType.options[indexPath.row].rawValue
        tableView.deselectRow(at: indexPath, animated: true)
        toggleVariantSelectionTableView()
        variantSelectionTextField.text = selectedVariant
    }
    
}

extension ViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AircraftType.options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableviewCellIdentifiers.variantCell, for: indexPath)
        let variant = AircraftType.options[indexPath.row]
        cell.textLabel?.text = variant.rawValue
        cell.detailTextLabel?.text = AircraftType.engineVariant(aircraftType: variant)
        return cell
    }
    
}

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
        
        return 0
    }
    
    
    
    
}

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
        
        return "Test"
        
    }
    
}

