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
    private var landingDistanceInputData = LandingDistanceInputData(flapSetting: .twentyFive,
                                                                    reverse: .two,
                                                                    wind: (180, 0),
                                                                    tempCelcius: 15,
                                                                    runwayBrakingAction: .dry,
                                                                    pressureMillibars: 1013) {
        didSet {
            if landingDistanceInputData.containsAllRequiredInputs() {
                landingDistances = LandingDistanceCalculator.calculateLandingDistances(inputData: landingDistanceInputData)
            }
            updateUI()
        }
    }
    
    private var landingDistances: [BrakingConfiguration : Int]? = nil {
        didSet {
            updateUI()
        }
    }
    
    private var selectedRunway: Runway? {
        get {
            return landingDistanceInputData.runway
        }
    }
    
    private var airports = [Airport]() {
        didSet {
            updateUI()
        }
    }
    private var filteredAirports = [Airport]() {
        didSet {
            updateUI()
        }
    }
    private var selectedAirport: Airport? = nil {
        didSet {
            landingDistanceInputData.runway = nil // airport has changed so make sure the selected runway is nil initially : updated in updateUI()
            updateUI()
        }
    }
    
    private var userIsSearchingForAirport : Bool {
        get {
            return airportSearchText.count > 0
        }
    }
    private var airportSearchText = "" {
        didSet {
            if airportSearchText.count == 0 {
                filteredAirports = []
            } else {
                filteredAirports = airports.filter({ (airport) -> Bool in
                    
                    // check if the airport name contains the search text
                    if airport.getName().lowercased().contains(airportSearchText.lowercased()) {
                        return true
                    }
                    // check if the code contains the search text
                    if airport.getCode().lowercased().contains(airportSearchText.lowercased()) {
                        return true
                    }
                    // if neither, return false 
                    return false 
                })
            }
            
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
    
    @IBOutlet weak var windPicker: UIPickerView!
    @IBOutlet weak var tempPicker: UIPickerView!
    @IBOutlet weak var brakingActionPicker: UIPickerView!
    
    @IBOutlet weak var pressureSettingPicker: UIPickerView! {
        didSet {
            pressureSettingPicker.dataSource = self
            pressureSettingPicker.delegate = self
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
    
    @IBOutlet weak var runwayDistanceStack: UIStackView!
    @IBOutlet weak var runwaySlopeStack: UIStackView!
    @IBOutlet weak var runwayElevationStack: UIStackView!
    @IBOutlet weak var runwayDistanceLabel: UILabel!
    @IBOutlet weak var runwaySlopeLabel: UILabel!
    @IBOutlet weak var runwayElevationLabel: UILabel!
    @IBOutlet weak var runwayHeadingLabel: UILabel!
    
    @IBOutlet weak var calculateLandingDistancesButton: UIButton! {
        didSet {
            calculateLandingDistancesButton.layer.cornerRadius = 5
            calculateLandingDistancesButton.clipsToBounds = true
            calculateLandingDistancesButton.isEnabled = false
            calculateLandingDistancesButton.isHidden = true
        }
    }
    
    @IBOutlet weak var calculatedLandingDistanceBorderView: UIView! {
        didSet {
            applyBorderStyles(view: calculatedLandingDistanceBorderView)
        }
    }
    
    @IBOutlet weak var maxManualDistanceLabel: UILabel!
    @IBOutlet weak var maxAutobrakDistanceLabel: UILabel!
    @IBOutlet weak var autobrakeFourDistanceLabel: UILabel!
    @IBOutlet weak var autobrakeThreeDistanceLabel: UILabel!
    @IBOutlet weak var autobrakeTwoDistanceLabel: UILabel!
    @IBOutlet weak var autobrakeOneDistanceLabel: UILabel!
    
    private lazy var landingDistanceLabels : [UILabel] = [
        maxManualDistanceLabel,
        maxAutobrakDistanceLabel,
        autobrakeFourDistanceLabel,
        autobrakeThreeDistanceLabel,
        autobrakeTwoDistanceLabel,
        autobrakeOneDistanceLabel
    ]
    
    // MARK:- IBActions
    
    @IBAction func userDidSelectFlapSetting(_ sender: UISegmentedControl) {
        view.endEditing(true)
        let index = sender.selectedSegmentIndex
        let title = sender.titleForSegment(at: index)!
        if let selectedFlapSetting = FlapSetting(rawValue: title) {
            landingDistanceInputData.flapSetting = selectedFlapSetting
        }
    }
    
    @IBAction func userDidSelectReverseThrust(_ sender: UISegmentedControl) {
        view.endEditing(true)
        let index = sender.selectedSegmentIndex
        let title = sender.titleForSegment(at: index)!
        if let reverseThrustSelection = ReverseThrustAvailable(rawValue: title) {
            landingDistanceInputData.reverseThrustAvailable = reverseThrustSelection
        }
    }
    
    @IBAction func userDidPressCalculateLandingDistances(_ sender: UIButton) {
        
        shouldHideView(view: sender, bool: true)
        shouldHideView(view: calculatedLandingDistanceBorderView, bool: false)
        LandingDistanceCalculator.calculateLandingDistances(inputData: landingDistanceInputData)
        
    }
    
    
    // MARK:- Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set delegate on AirportDataStore to subscribe to updates on airports data model
        AirportDataStore.shared.delegate = self
        
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    // MARK:- Helper Methods
    private func shouldHideView(view: UIView, bool: Bool) {
        view.isHidden = bool
    }
    
    private func applyBorderStyles(view: UIView) {
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
    }
    
    private func updateUI() {
        
        updateLandingDistanceLabels()
        
        syncInputControlsWithLandingDistanceInputModel()
        
        airportSelectionTableView.reloadData()
        
        if selectedRunway == nil && selectedAirport != nil {
            runwayPicker.selectRow(0, inComponent: 0, animated: true)
            landingDistanceInputData.runway = selectedAirport?.getRunways().first!
        }
        
        // every time the selected airport changes, update the runways to correspond
        runwayPicker.reloadAllComponents()
        
        if airportSearchText == "" {
            airportTextField.text = selectedAirport?.getName()
        } else {
            airportTextField.text = airportSearchText
        }
        
        updateRunwayInfoUI()
        
//        calculateLandingDistancesButton.isEnabled = landingDistanceInputData.containsAllRequiredInputs()
//        calculateLandingDistancesButton.alpha = calculateLandingDistancesButton.isEnabled ? 1 : 0.5
    }
    
    private func updateLandingDistanceLabels() {
        if !landingDistanceInputData.containsAllRequiredInputs() {
            for label in landingDistanceLabels {
                label.text = "---------"
            }
        }
        else if landingDistances != nil {
            maxManualDistanceLabel.text = "\(landingDistances![.maxManual]!)m"
            maxAutobrakDistanceLabel.text = "\(landingDistances![.autobrakeMax]!)m"
            autobrakeFourDistanceLabel.text = "\(landingDistances![.autobrakeFour]!)m"
            autobrakeThreeDistanceLabel.text = "\(landingDistances![.autobrakeThree]!)m"
            autobrakeTwoDistanceLabel.text = "\(landingDistances![.autobrakeTwo]!)m"
            autobrakeOneDistanceLabel.text = "\(landingDistances![.autobrakeOne]!)m"
        }
    }
    
    private func syncInputControlsWithLandingDistanceInputModel() {
        
        // set flap segmented control
        if let flapSelection = landingDistanceInputData.flapSetting {
            
            for i in 0..<flapSelectionSegmentedControl.numberOfSegments {
                let title = flapSelectionSegmentedControl.titleForSegment(at: i)!
                if title == flapSelection.rawValue {
                    flapSelectionSegmentedControl.selectedSegmentIndex = i
                    break
                }
            }
        }
        
        // set the reverser segmented control
        if let reverseSelection = landingDistanceInputData.reverseThrustAvailable {
            for i in 0..<reverseThrustSegmentedControl.numberOfSegments {
                let title = reverseThrustSegmentedControl.titleForSegment(at: i)
                if title == reverseSelection.rawValue {
                    reverseThrustSegmentedControl.selectedSegmentIndex = i
                    break
                }
            }
        }
        
        
        // set text in weight textField
        var weightText = ""
        if let aircraftWeight = landingDistanceInputData.aircraftWeightTonnes {
            weightText = "\(aircraftWeight)T"
        }
        weightTextField.text = weightText
        
        // set the variant
        variantSelectionTextField.text = landingDistanceInputData.aircraftVariant?.rawValue ?? ""
        
        // set the wind picker
        if let (windDirection, windSpeed) = landingDistanceInputData.wind {
            // search the picker's data model to check for the index of direction and set it
            for (i, direction) in WeatherInputData.windDirectionData.enumerated() {
                if windDirection == direction {
                    windPicker.selectRow(i, inComponent: 0, animated: false)
                    break
                }
            }
            // search the picker's data mode to check for the index of speed and set it
            for (i, speed) in WeatherInputData.windSpeedData.enumerated() {
                if windSpeed == speed {
                    windPicker.selectRow(i, inComponent: 1, animated: false)
                    break
                }
            }
        }
        
        // set the temperature
        if let temperature = landingDistanceInputData.temperatueCelcius {
            for (i, temp) in WeatherInputData.temperatureData.enumerated() {
                if temp == temperature {
                    tempPicker.selectRow(i, inComponent: 0, animated: false)
                    break
                }
            }
        }
        
        // set the braking action
        if let brakingAction = landingDistanceInputData.runwayBrakingAction {
            for (i, brakingActionOption) in RunwayCondition.options.enumerated() {
                if brakingAction == brakingActionOption {
                    brakingActionPicker.selectRow(i, inComponent: 0, animated: false)
                    break
                }
            }
        }
        
        // set the pressure picker
        if let pressureSetting = landingDistanceInputData.pressureMillibars {
            for (i, pressure) in WeatherInputData.pressureDataMillibars.enumerated() {
                if pressureSetting == pressure {
                    pressureSettingPicker.selectRow(i, inComponent: 0, animated: false)
                    break
                }
            }
        }
        
    }
    
    private func updateRunwayInfoUI() {
        
        runwayDistanceStack.isHidden = selectedRunway == nil
        runwaySlopeStack.isHidden = selectedRunway == nil
        runwayElevationStack.isHidden = selectedRunway == nil
        
        let runwayDistanceText = selectedRunway == nil ? "" : "\(selectedRunway!.getDistanceMeters())m"
        let runwaySlopeText = selectedRunway == nil ? "" : "\(selectedRunway!.getSlope())%"
        let runwayElevationText = selectedRunway == nil ? "" : "\(selectedRunway!.getElevationFeet())ft"
        var runwayHeadingText: String = ""
        if let selectedRunway = selectedRunway {
            let runwayHeading = selectedRunway.getOrientation()
            if runwayHeading < 100 {
                runwayHeadingText = "0\(runwayHeading)"
            } else {
                runwayHeadingText = "\(runwayHeading)"
            }
        }
        
        runwayDistanceLabel.text = runwayDistanceText
        runwaySlopeLabel.text = runwaySlopeText
        runwayElevationLabel.text = runwayElevationText
        runwayHeadingLabel.text = runwayHeadingText
    }

}
// MARK:- UITextFieldDelegate
extension ViewController : UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        if textField == weightTextField {
            landingDistanceInputData.aircraftWeightTonnes = nil
        }
        
        if textField == variantSelectionTextField {
            shouldHideView(view: variantSelectionTableView, bool: false)
            return false
        }
        
        if textField == airportTextField {
            shouldHideView(view: airportSelectionTableView, bool: false)
            selectedAirport = nil
            return true
        }
        
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
       
        if textField == airportTextField {
            airportSearchText = NSString(string: textField.text!).replacingCharacters(in: range, with: string)
            return false
        }
        
        if textField == weightTextField {
            
            if string == "" { return true }
            
            if string == "." && textField.text!.count > 0 {
                if let existingText = textField.text, existingText.contains(".") {
                    return false
                }
                else {
                    return true
                }

            }
            
            // make sure the replacement string can be convered to a double
            if let _ = Double(string) {
                return true
            } else {
                return false
            }
        }
        
        return true
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        
        if textField == weightTextField {
            if let text = textField.text, text.count > 0, let weight = Double(text) {
                landingDistanceInputData.aircraftWeightTonnes = weight
            } else {
                landingDistanceInputData.aircraftWeightTonnes = nil
            }
        }
        
        if textField == airportTextField {
            shouldHideView(view: airportSelectionTableView, bool: true)
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
            let selectedVariant = AircraftType.options[indexPath.row]
            tableView.deselectRow(at: indexPath, animated: true)
            shouldHideView(view: variantSelectionTableView, bool: true)
            landingDistanceInputData.aircraftVariant = selectedVariant
        }
        else if tableView == airportSelectionTableView {
            selectedAirport = airports[indexPath.row]
            airportSearchText = ""
            shouldHideView(view: airportSelectionTableView, bool: true)
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
            return userIsSearchingForAirport ? filteredAirports.count : airports.count
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = UITableViewCell()
        var titleText = ""
        var detailText = ""
        
        if tableView == airportSelectionTableView {
            cell = tableView.dequeueReusableCell(withIdentifier: TableviewCellIdentifiers.airportCell, for: indexPath)
            let airport = userIsSearchingForAirport ? filteredAirports[indexPath.row] : airports[indexPath.row]
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
        
        // runways
        if pickerView == runwayPicker {
            if let selectedAirport = selectedAirport {
                return selectedAirport.getRunways().count
            } else {
                return 1
            }
        }
        
        // pressure setting
        if pickerView == pressureSettingPicker {
            return WeatherInputData.pressureDataMillibars.count
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
        
        // pressure settings
        if pickerView == pressureSettingPicker {
            return "\(WeatherInputData.pressureDataMillibars[row])mb"
        }
        
        return ""
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        // handle runway picker selection
        if pickerView == runwayPicker {
            landingDistanceInputData.runway = selectedAirport?.getRunways()[row]
        }
        
        // handle wind picker selection
        if pickerView == windPicker {
            if component == 0 {
                let direction = WeatherInputData.windDirectionData[row]
                landingDistanceInputData.wind?.direction = direction
            }
            else if component == 1 {
                let speed = WeatherInputData.windSpeedData[row]
                landingDistanceInputData.wind?.speed = speed
            }
            
        }
        
        // handle temperature picker selection
        if pickerView == tempPicker {
            let selectedTemp = WeatherInputData.temperatureData[row]
            landingDistanceInputData.temperatueCelcius = selectedTemp
        }
        
        // handle braking action picker selection
        if pickerView == brakingActionPicker {
            let selectedBrakingAction = RunwayCondition.options[row]
            landingDistanceInputData.runwayBrakingAction = selectedBrakingAction
        }
        
        // handle pressure setting picker selection
        if pickerView == pressureSettingPicker {
            let selectedPressureSetting = WeatherInputData.pressureDataMillibars[row]
            landingDistanceInputData.pressureMillibars = selectedPressureSetting
        }
    
    }
    
}

// MARK:- AirportDataStoreDelegate
extension ViewController: AirportDataStoreDelegate {
    
    func airportDataStoreDidUpdate(airports: [Airport]) {
        
        if let selectedAirport = selectedAirport, let selectedRunway = selectedRunway {
            
            // check if the airport is still contained within the dataset
            if airports.contains(where: {$0.getCode() == selectedAirport.getCode()}) {
    
                // update the airport with selected airport
                self.selectedAirport = airports.first(where: { $0.getCode() == selectedAirport.getCode() })
                
                // check whether there is still runway data in the dataset for selected runway
                if self.selectedAirport!.getRunways().contains(where: { $0.getName() == selectedRunway.getName() }) {
                    // replace the runway with the new one to make sure in sync
                    self.landingDistanceInputData.runway = self.selectedAirport?.getRunways().first(where: {$0.getName() == selectedRunway.getName() })
                }
            }
        }
        
        self.airports = airports
    }
    
}

