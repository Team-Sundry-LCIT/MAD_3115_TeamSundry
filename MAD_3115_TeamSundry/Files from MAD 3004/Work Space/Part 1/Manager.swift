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
        let text = """
         He/She travelled \(nbTravelDays) days and
        has brought \(nbClients) new clients.
        His/Her estimated annual income is \(annualIncome())
        """
        return text
    }
    
    init(name: String, birthYear: Int, nbClients: Int, nbTravelDays: Int, rate: Int = 100, employeeVehicle: VehicleProtocol? = nil) {
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
