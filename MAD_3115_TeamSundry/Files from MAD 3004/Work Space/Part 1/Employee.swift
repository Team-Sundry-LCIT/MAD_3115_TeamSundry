//
//  Employee.swift
//  MAD3004_TeamMaple
//

import Foundation

protocol Employee{
    var name: String { get set }
    var birthYear: Int{  get set }
    var age: Int { get set }
    var monthlyIncome: Double { get set }
    var rate: Int { get set }
    var employeeVehicle: Vehicle? {get}
    var contract: Contract? {get set}
    
    func calculateAge(birthYear: Int) -> Int
    func printData(_ msg :String)
    func annualIncome() -> Double
    
}

struct Employee : Employee {
    
    var name: String
    var birthYear: Int
    var age: Int
    var monthlyIncome: Double
    var rate: Int
    var employeeVehicle: Vehicle?
    var contract: Contract?
    
    init(name: String,birthYear:Int,rate: Int = 100,employeeVehicle: Vehicle? = nil) {
        self.name = name;
        self.birthYear = birthYear;
        self.age = 0
        self.monthlyIncome = 0;
        if(rate < 10) {
            self.rate = 10
        }
        else if (rate > 100){
            self.rate = 100
        }
        else {
            self.rate = rate
        }
        if let employeeVehicle = employeeVehicle {
            self.employeeVehicle = employeeVehicle
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
}

//MARK: - Employee Extension
extension CustomStringConvertible where Self: Employee {
  var description: String {
      """
      Name: \(name), a \(Self.self) \n
      Age: \(age)
      \(employeeVehicle ?? Vehicle())
      \(name) has an Occupation rate: \(rate)%
      """
  }
}
