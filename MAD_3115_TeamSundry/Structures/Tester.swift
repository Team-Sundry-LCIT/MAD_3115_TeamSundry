//
//  Tester.swift
//  MAD3004_TeamMaple
//

import Foundation

protocol TesterProtocol  {
    var nbBugs: Int { get set }
    var gainFactorError: Int { get }
}

struct Tester: TesterProtocol, EmployeeProtocol, EmployeeContract {
    var employeeID: String
    var name: String
    var birthYear: Int
    var age: Int
    var monthlyIncome: Double
    var rate: Int
    var employeeVehicle: VehicleProtocol?
    var contract: ContractProtocol?
    var nbBugs: Int = 0
    let gainFactorError = 10
    
    var description: String {
        let text =
           """
           Name: \(name), a \(Self.self)
           Age: \(age) \n
           \(employeeVehicle != nil ? employeeVehicle!.description : "")
           Occupation rate : \(rate)%
           Annual income : $ \(annualIncome())
        He/She has corrected \(nbBugs) bugs.
        """
        return text
    }
    
    init(employeeId : String, name: String, birthYear: Int,nbBugs: Int,rate:Int=100,employeeVehicle: VehicleProtocol?=nil){
        self.employeeID = employeeId
        self.name = name
        self.birthYear = birthYear
        self.rate = rate
        self.nbBugs = nbBugs
        self.employeeVehicle = employeeVehicle
        self.age = 0
        self.monthlyIncome = 0;
        printData(description)
    }
    
     func annualIncome() -> Double {
        let baseYearlyIncome = (monthlyIncome * Double(12)) * Double(rate)/100
        let bonus = Double(gainFactorError * nbBugs)
        return baseYearlyIncome + bonus
    }
    
    func printData(_ msg :String){
        print(msg)
    }
}

