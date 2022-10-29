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
        let text = """
         and corrected \(nbBugs) bugs.
        His/Her estimated annual income is \(annualIncome())
        """
        return text
    }
    
    init(name: String, birthYear: Int,nbBugs: Int,rate:Int=100,employeeVehicle: VehicleProtocol?=nil){
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

