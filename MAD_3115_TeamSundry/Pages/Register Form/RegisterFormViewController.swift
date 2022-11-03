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
    
    var employeeType : [String] = ["Programmer", "Manager", "Tester"]
    var selectedEmployeeType : String = ""
    
    var vehicleColor: [String] = ["Red", "Blue", "Yellow", "Green","Orange","Purple","Pink", "Brown", "White", "Black", "Beige"]
    var selectedVehicleColor = ""
    
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
    }
    
    // MARK: - @IBAction
    
    @IBAction func noOfTypeCountChange(_ sender: UIStepper) {
        noOfTypesForEmployeeTextField.text = Int(noOfTypesForEmployeeStepper.value).description
    }
    
    @IBAction func dismissKeyBoard(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    @IBAction func registerAction(_ sender: Any) {
    }
    
    @IBAction func vehicleTypeSelectAction(_ sender: UIButton) {
    }
    
    @IBAction func sideCarSelectAction(_ sender: UIButton) {
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
        }
        
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == employeeTypePicker {
            return employeeType[row]
        } else if pickerView == vehicleColorPickerView {
            return vehicleColor[row]
        }
        
        return ""
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
        self.employeeTypeTextField.text = selectedEmployeeType
        if self.selectedEmployeeType == "Programmer"{
            self.noOfTypesForEmployeeLabel.text = "# Projects"
            self.noOfTypesForEmployeeTextField.text = ""
        }else if self.selectedEmployeeType == "Manager"{
            self.noOfTypesForEmployeeLabel.text = "# Clients"
            self.noOfTypesForEmployeeTextField.text = ""
        }else if self.selectedEmployeeType == "Tester"{
            self.noOfTypesForEmployeeLabel.text = "# Bugs"
            self.noOfTypesForEmployeeTextField.text = ""
        }else{
            self.noOfTypesForEmployeeLabel.isHidden = true
            self.noOfTypesForEmployeeTextField.isHidden = true
        }
    }
    
    private func vehicleColorChanged(){
        self.vehicleColorPickerView.isHidden = true
        self.vehicleColorTextField.text = selectedVehicleColor
    }
}
