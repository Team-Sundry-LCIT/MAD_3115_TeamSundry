//
//  RegisterFormViewController.swift
//  MAD_3115_TeamSundry
//
//  Created by Alice’z Poy on 2022-10-28.
//

import UIKit

class RegisterFormViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource,UITextFieldDelegate {
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var birthYearTextField: UITextField!
    @IBOutlet weak var monthlySalaryTextField: UITextField!
    @IBOutlet weak var occupationRateTextField: UITextField!
    @IBOutlet weak var employeeIDTextField: UITextField!
    @IBOutlet weak var employeeTypeTextField: UITextField!
    @IBOutlet weak var noOfTypesForEmployeeLabel: UILabel!
    @IBOutlet weak var noOfTypesForEmployeeTextField: UITextField!
    @IBOutlet weak var noOfTypesForEmployeeStepper: UIStepper!
    @IBOutlet weak var employeeTypePicker: UIPickerView!
    
    @IBOutlet weak var carButton: UIButton!
    @IBOutlet weak var motorbikeButton: UIButton!
    @IBOutlet weak var sideCarYesButton: UIButton!
    @IBOutlet weak var sideCarNoButton: UIButton!
    @IBOutlet weak var sideCarStackView: UIStackView!
    @IBOutlet weak var carTypeTextfield: UITextField!
    @IBOutlet weak var carTypeStackView: UIStackView!
    @IBOutlet weak var vehicleModelTextField: UITextField!
    @IBOutlet weak var plateNumberTextField: UITextField!
    @IBOutlet weak var vehicleColorTextField: UITextField!
    @IBOutlet weak var vehicleColorPickerView: UIPickerView!
    
    var employeeType : [EmployeeType] = [EmployeeType.Programmer, EmployeeType.Manager, EmployeeType.Tester]
    var selectedEmployeeType : EmployeeType = .Programmer
    
    var vehicleColor: [String] = ["Red", "Blue", "Yellow", "Green","Orange","Purple","Pink", "Brown", "White", "Black", "Beige"]
    var selectedVehicleColor = ""
    var selectedVehicleType = VehicleType.Car
    var isSideCar: Bool?
    var newEmployee : EmployeeProtocol?
    weak var delegate: EmployeeListViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        noOfTypesForEmployeeStepper.wraps = true
        noOfTypesForEmployeeStepper.autorepeat = true
        employeeTypeTextField.inputView = employeeTypePicker
        selectedEmployeeType = self.employeeType[0]
        employeeTypeChanged()
        
        vehicleColorTextField.inputView = vehicleColorPickerView
        selectedVehicleColor = vehicleColor[0]
        vehicleColorChanged()
        
        selectdVehicleType(isCar: true)
        setRadioImageForButton(button: carButton, isSelected: true)
        setRadioImageForButton(button: motorbikeButton, isSelected: false)
        setRadioImageForButton(button: sideCarYesButton, isSelected: true)
        setRadioImageForButton(button: sideCarNoButton, isSelected: false)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        delegate?.updateEmployeeList(with: newEmployee!)
    }
    
    func setRadioImageForButton(button: UIButton, isSelected: Bool) {
        if isSelected {
            button.setImage(UIImage(named: "Radio_Selected"), for: .normal)
        } else {
            button.setImage(UIImage(named: "Radio_Unselect"), for: .normal)
        }
    }
    
    // MARK: - @IBAction
    
    @IBAction func noOfTypeCountChange(_ sender: UIStepper) {
        noOfTypesForEmployeeTextField.text = Int(noOfTypesForEmployeeStepper.value).description
    }
    
    @IBAction func dismissKeyBoard(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    @IBAction func registerAction(_ sender: Any) {
        if validateEmployee() {
            let employeeName = (firstNameTextField.text ?? "") + " " + (lastNameTextField.text ?? "")
            let year = Int(birthYearTextField.text ?? "0") ?? 0
            let rate = Int(occupationRateTextField.text ?? "0")  ?? 0
            let noOfTypes = Int(noOfTypesForEmployeeTextField.text ?? "0") ?? 0
            
            newEmployee = Employee(name: employeeName, birthYear: year, rate: rate )
  
            
            switch selectedEmployeeType {
                case .Programmer:
                    newEmployee = Programmer(name: employeeName, birthYear: year, nbProjects: noOfTypes, rate: rate )

                case .Tester:
                    newEmployee = Tester(name: employeeName, birthYear: year, nbBugs: noOfTypes, rate: rate)
                case .Manager:
                    newEmployee = Manager(name: employeeName, birthYear: year, nbClients: noOfTypes, nbTravelDays: 0, rate: rate)
            }
            
            newEmployee?.age = newEmployee?.calculateAge(birthYear: year) ?? 0
            newEmployee?.employeeVehicle = getEmploeyeeVehicle()
                    
        }else{
            showAlert(title: "Error", actionTitle: "OK", message: "Something went wrong. Please check your entered values.", preferredStyle: .alert)
        }
    }
    
    @IBAction func vehicleTypeSelectAction(_ sender: UIButton) {
        switch sender {
        case carButton:
            setRadioImageForButton(button: carButton, isSelected: true)
            setRadioImageForButton(button: motorbikeButton, isSelected: false)
            selectedVehicleType = VehicleType.Car
            selectdVehicleType(isCar: true)
        case motorbikeButton:
            setRadioImageForButton(button: carButton, isSelected: false)
            setRadioImageForButton(button: motorbikeButton, isSelected: true)
            selectedVehicleType = VehicleType.Motorbike
            selectdVehicleType(isCar: false)
        default:
            break
        }
    }
    
    @IBAction func sideCarSelectAction(_ sender: UIButton) {
        switch sender {
        case sideCarYesButton:
            setRadioImageForButton(button: sideCarYesButton, isSelected: true)
            setRadioImageForButton(button: sideCarNoButton, isSelected: false)
            isSideCar = true
        case sideCarNoButton:
            setRadioImageForButton(button: sideCarYesButton, isSelected: false)
            setRadioImageForButton(button: sideCarNoButton, isSelected: true)
            isSideCar = false
        default:
            isSideCar = nil
            break
        }
    }
    
    func selectdVehicleType(isCar: Bool) {
        if isCar {
            sideCarStackView.isHidden = true
            carTypeStackView.isHidden = false
        } else {
            sideCarStackView.isHidden = false
            carTypeStackView.isHidden = true
        }
    }
    
    // MARK: - TextField Delegate
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField == self.employeeTypeTextField {
            self.employeeTypePicker.isHidden = false
            return false
        } else if textField == self.vehicleColorTextField {
            self.vehicleColorPickerView.isHidden = false
            return false
        }
        return true
    }
    
    // MARK: - PickerView Delegate
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == employeeTypePicker {
            return employeeType.count
        } else if pickerView == vehicleColorPickerView {
            return vehicleColor.count
        } else {
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == employeeTypePicker {
            return employeeType[row].rawValue
        } else if pickerView == vehicleColorPickerView {
            return vehicleColor[row]
        } else {
            return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == employeeTypePicker {
            selectedEmployeeType = employeeType[row] // selected item
            self.employeeTypeChanged()
        } else if pickerView == vehicleColorPickerView {
            selectedVehicleColor = vehicleColor[row] // selected item
            self.vehicleColorChanged()
        }
    }
    
    private func employeeTypeChanged(){
        self.employeeTypePicker.isHidden = true
        self.employeeTypeTextField.text = selectedEmployeeType.rawValue
        
//        if self.selectedEmployeeType == "Programmer"{
//            self.noOfTypesForEmployeeLabel.text = "# Projects"
//            self.noOfTypesForEmployeeTextField.text = ""
//        }else if self.selectedEmployeeType == "Manager"{
//            self.noOfTypesForEmployeeLabel.text = "# Clients"
//            self.noOfTypesForEmployeeTextField.text = ""
//        }else if self.selectedEmployeeType == "Tester"{
//            self.noOfTypesForEmployeeLabel.text = "# Bugs"
//            self.noOfTypesForEmployeeTextField.text = ""
//        }else{
//            self.noOfTypesForEmployeeLabel.isHidden = true
//            self.noOfTypesForEmployeeTextField.isHidden = true
//        }
        
        
        switch selectedEmployeeType {
            case .Programmer:
                self.noOfTypesForEmployeeLabel.text = "# Projects"
                self.noOfTypesForEmployeeTextField.text = ""
            case .Tester:
                self.noOfTypesForEmployeeLabel.text = "# Bugs"
                self.noOfTypesForEmployeeTextField.text = ""
            case .Manager:
                self.noOfTypesForEmployeeLabel.text = "# Clients"
                self.noOfTypesForEmployeeTextField.text = ""
        }
    }
    
    private func vehicleColorChanged(){
        self.vehicleColorPickerView.isHidden = true
        self.vehicleColorTextField.text = selectedVehicleColor
    }
    
    private func validateEmployee() -> Bool {
        
        if firstNameTextField.text == "" {
            showAlert(title: "Error", actionTitle: "OK", message: "Please provide the first name to continue.", preferredStyle: .alert)
            return false
        }else if lastNameTextField.text == "" {
            showAlert(title: "Error", actionTitle: "OK", message: "Please provide the last name to continue.", preferredStyle: .alert)
            return false
        }else if birthYearTextField.text == "" {
            showAlert(title: "Error", actionTitle: "OK", message: "Please provide the birth year to continue.", preferredStyle: .alert)
            return false
        }else if monthlySalaryTextField.text == "" {
            showAlert(title: "Error", actionTitle: "OK", message: "Please provide the monthly salary to continue.", preferredStyle: .alert)
            return false
        }else if occupationRateTextField.text == "" {
            showAlert(title: "Error", actionTitle: "OK", message: "Please provide the occupation rate to continue.", preferredStyle: .alert)
            return false
        }else if employeeIDTextField.text == "" {
            showAlert(title: "Error", actionTitle: "OK", message: "Please provide the employee ID to continue.", preferredStyle: .alert)
            return false
        }else if vehicleModelTextField.text == "" {
            showAlert(title: "Error", actionTitle: "OK", message: "Please provide the vehicle model to continue.", preferredStyle: .alert)
            return false
        }else if plateNumberTextField.text == "" {
            showAlert(title: "Error", actionTitle: "OK", message: "Please provide the plate number to continue.", preferredStyle: .alert)
            return false
        }else if vehicleColorTextField.text == "" {
            showAlert(title: "Error", actionTitle: "OK", message: "Please provide the vehicle color to continue.", preferredStyle: .alert)
            return false
        }else if noOfTypesForEmployeeTextField.text == "" {
            var type = "projects"
            switch selectedEmployeeType {
                case .Programmer:
                    type = "projects"
                case .Tester:
                    type = "bugs"
                case .Manager:
                    type = "clients"
            }
            showAlert(title: "Error", actionTitle: "OK", message: "Please provide the " + type + " count to continue.", preferredStyle: .alert)
            return false
        }else if selectedVehicleType == .Car{
            if carTypeTextfield.text == "" {
                showAlert(title: "Error", actionTitle: "OK", message: "Please provide the car type to continue.", preferredStyle: .alert)
                return false
            }else{
                return true
            }
        }else if selectedVehicleType == .Motorbike{
            if isSideCar == nil {
                showAlert(title: "Error", actionTitle: "OK", message: "Please provide the side car type to continue.", preferredStyle: .alert)
                return false
            }else{
                return true
            }
        }else {            
            return true
        }
    }
    
    private func getEmploeyeeVehicle() -> VehicleProtocol? {
        if selectedVehicleType == .Car{
            let car = Car(make: vehicleModelTextField.text ?? "", plate: plateNumberTextField.text ?? "", color: vehicleColorTextField.text ?? "", category: selectedVehicleType.rawValue, gear: "Manual", type: carTypeTextfield.text ?? "")
            return car
        }else if selectedVehicleType == .Motorbike{
            let motorcycle = Motorcycle(make: vehicleModelTextField.text ?? "", plate: plateNumberTextField.text ?? "", color: vehicleColorTextField.text ?? "", category: selectedVehicleType.rawValue, sidecar: isSideCar ?? false)
            return motorcycle
        }else {
            return nil
        }
    }
    
    private func showAlert(title : String, actionTitle : String, message : String, preferredStyle : UIAlertController.Style){
        
        let alert = UIAlertController(title:title , message:message , preferredStyle: preferredStyle)
        let action = UIAlertAction(title: actionTitle, style: .cancel)
        alert.addAction(action)
        present(alert, animated: true)
    }
}


enum EmployeeType : String, CaseIterable{
    case Programmer
    case Manager
    case Tester
    
}

enum VehicleType : String, CaseIterable{
    case Car
    case Motorbike
}
