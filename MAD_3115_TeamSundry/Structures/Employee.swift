//
//  Employee.swift
//  MAD3004_TeamMaple
//

import Foundation

protocol EmployeeProtocol{
    var name: String { get set }
    var birthYear: Int{  get set }
    var age: Int { get set }
    var monthlyIncome: Double { get set }
    var rate: Int { get set }
    var employeeVehicle: VehicleProtocol? {get set}
    var contract: ContractProtocol? { get set }
    
    func calculateAge(birthYear: Int) -> Int
    func printData(_ msg :String)
    func annualIncome() -> Double
    func contractInfo() -> String
}

struct Employee : EmployeeProtocol, EmployeeContract {

    var name: String
    var birthYear: Int
    var age: Int
    var monthlyIncome: Double
    var rate: Int
    var employeeVehicle: VehicleProtocol?
    var contract: ContractProtocol?
    
    init(name: String,birthYear:Int,rate: Int = 100,employeeVehicle: VehicleProtocol? = nil) {
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
    
    func printData(_ msg :String){
        print(msg)
    }
    
    func annualIncome() -> Double {
        let baseYearlyIncome = (monthlyIncome * Double(12)) * Double(rate)/100
        return baseYearlyIncome
    }
}

//MARK: - Employee Extension
extension Employee : CustomStringConvertible {
  var description: String {
      """
      Name: \(name), a \(Self.self) \n
      Age: \(age)
      \(employeeVehicle ?? Vehicle())
      \(name) has an Occupation rate: \(rate)%
      """
  }
}

extension EmployeeProtocol{
    
    func calculateAge(birthYear: Int) -> Int {
        if birthYear > 0 {
            let date = Date()
            let currentYear = Calendar.current.component(.year, from: date)
            return currentYear - birthYear
         }
         return 0
    }
}
