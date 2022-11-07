//
//  Manager.swift
//  MAD3004_TeamMaple
//

import Foundation

protocol ManagerProtocol  {
    var nbTravelDays: Int { get set }
    var nbClients: Int { get set }
    var GainFactorClient: Int { get }
    var GainFactorTravel: Int { get }
}

struct Manager: ManagerProtocol, EmployeeProtocol, EmployeeContract {
    var employeeID: String
    var name: String
    var birthYear: Int
    var age: Int
    var monthlyIncome: Double
    var rate: Int
    var employeeVehicle: VehicleProtocol?
    var contract: ContractProtocol?
    
    var nbClients: Int
    var nbTravelDays: Int
    let GainFactorClient = 500
    let GainFactorTravel = 100
    
    var description: String {
        let text =
           """
           Name: \(name), a \(Self.self)
           Age: \(age) \n
           \(employeeVehicle != nil ? employeeVehicle!.description : "")
           Occupation rate : \(rate)%
           Annual income : $ \(annualIncome())
        He/She has brought \(nbClients) new clients.
        """
        return text
    }
    
    init(employeeId : String, name: String, birthYear: Int, nbClients: Int, nbTravelDays: Int, rate: Int = 100, employeeVehicle: VehicleProtocol? = nil) {
        self.employeeID = employeeId
        self.name = name
        self.birthYear = birthYear
        self.age = 0
        self.monthlyIncome = 0
        self.rate = rate
        self.employeeVehicle = employeeVehicle
        self.nbClients = nbClients
        self.nbTravelDays = nbTravelDays
        
        printData(description)
    }
    
    func printData(_ msg :String){
        print(msg)
    }
    
    func annualIncome() -> Double {
        let baseYearlyIncome = (monthlyIncome * Double(12)) * Double(rate)/100
        let clientBonus = Double(GainFactorClient * nbClients)
        let expenditure = Double(GainFactorTravel * nbTravelDays)
        return baseYearlyIncome + clientBonus + expenditure
    }
}
