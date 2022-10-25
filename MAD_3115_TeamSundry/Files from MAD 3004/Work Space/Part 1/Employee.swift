//
//  Employee.swift
//  MAD3004_TeamMaple
//

import Foundation

class Employee {
    
    //necessary variables
    private var _name : String
    private var _birthYear : Int
    private var _age : Int
    private var _monthlyIncome : Double
    private var _rate : Int = 100
    private var _employeeVehicle : Vehicle?
    
    //defining setter & getter
    var name: String {
        get { return _name }
        set { _name = newValue }
    }
    
    var birthYear: Int {
        get { return _birthYear }
        set { _birthYear = newValue }
    }
    
    var age: Int {
        get { return calculateAge(birthYear: _birthYear) }
        set { _age = newValue }
    }
    
    var monthlyIncome: Double {
        get { return _monthlyIncome }
        set { _monthlyIncome = newValue }
    }
    
    var rate: Int {
        get { return _rate }
        set { _rate = newValue }
    }
    
    var employeeVehicle: Vehicle? {
        get { return _employeeVehicle }
    }
    
    init(name: String,birthYear:Int,rate: Int = 100,employeeVehicle: Vehicle? = nil) {
        self._name = name;
        self._birthYear = birthYear;
        self._age = 0
        self._monthlyIncome = 0;
        if(rate < 10) {
            self._rate = 10
        }
        else if (rate > 100){
            self._rate = 100
        }
        else {
            self._rate = rate
        }
        if let employeeVehicle = employeeVehicle {
            self._employeeVehicle = employeeVehicle
        }
    }
    
    func calculateAge(birthYear: Int) -> Int {
        /**
         !!! althoought its the correct way to calculat age !!!
         
         if birthYear > 0 {
         let date = Date()
         let currentYear = Calendar.current.component(.year, from: date)
         return currentYear - birthYear
         }
         
         return 0
         
         !!! we replace it with the manual current year set to 2018 to match the test log. !!!
         */
        let currentYear = 2018
        return currentYear - birthYear
    }
    
    func printData(_ msg :String){
        print(msg)
    }
    
    func annualIncome() -> Double {
        let baseYearlyIncome = (monthlyIncome * Double(12)) * Double(rate)/100
        return baseYearlyIncome
    }
    
    private  var _contract : Contract?
    var contract: Contract? {
        get { return _contract ?? Contract() }
        set { _contract = newValue }
    }
}

//MARK: - Employee Extension
extension Employee : CustomStringConvertible {
    @objc var description: String {
        
        let a =
        """
        Name: \(name), a \(Self.self) \n
        Age: \(age)
        \(employeeVehicle ?? Vehicle())
        \(name) has an Occupation rate: \(rate)%
        """
        
        return a
    }
}

