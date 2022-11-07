//
//  Programmer.swift
//  MAD3004_TeamMaple
//

import Foundation

protocol ProgrammerProtocol  {
    var nbProjects: Int { get set }
    var GainFactorProjects: Int { get }
}

struct Programmer: ProgrammerProtocol, EmployeeProtocol, EmployeeContract {
    var employeeID: String
    var name: String
    var birthYear: Int
    var age: Int
    var monthlyIncome: Double
    var rate: Int
    var employeeVehicle: VehicleProtocol?
    var contract: ContractProtocol?
    
    var nbProjects: Int = 0
    let GainFactorProjects = 200
    
    var description: String {
       let text =
          """
          Name: \(name), a \(Self.self)
          Age: \(age) \n
          \(employeeVehicle != nil ? employeeVehicle!.description : "")
          Occupation rate : \(rate)%
          Annual income : $ \(annualIncome())
          He/She has completed \(nbProjects) projects.
          """
        return text
    }
    
    init(employeeId : String, name: String, birthYear: Int, nbProjects: Int, rate: Int = 100, employeeVehicle: VehicleProtocol? = nil) {
        self.employeeID = employeeId
        self.name = name
        self.birthYear = birthYear
        self.age = 0
        self.monthlyIncome = 0
        self.rate = rate
        self.employeeVehicle = employeeVehicle
        self.nbProjects = nbProjects
        printData(description)
    }
    
    func printData(_ msg :String){
        print(msg)
    }
    
    func annualIncome() -> Double {
        let baseYearlyIncome = (monthlyIncome * Double(12)) * Double(rate)/100
        let bonus = Double(GainFactorProjects * nbProjects)
        return baseYearlyIncome + bonus
    }
}


