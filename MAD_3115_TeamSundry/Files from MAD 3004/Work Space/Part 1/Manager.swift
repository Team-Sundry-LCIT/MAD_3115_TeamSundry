//
//  Manager.swift
//  MAD3004_TeamMaple
//

import Foundation

class Manager: Employee {
    
    private var _nbTravelDays: Int=0
    private var _nbClients : Int=0
    
    private let _GainFactorClient = 500
    private let _GainFactorTravel = 100
    
    var nbTravelDays: Int {
        get { return _nbTravelDays }
        set { _nbTravelDays = newValue }
    }
    
    var nbClients: Int {
        get { return _nbClients }
        set { _nbClients = newValue }
    }
    
    init(name: String, birthYear: Int,nbClients: Int,nbTravelDays: Int,rate:Int=100, employeeVehicle: Vehicle?=nil) {
        super.init(name: name, birthYear: birthYear,rate: rate,employeeVehicle: employeeVehicle)
        self._nbTravelDays = nbTravelDays;
        self._nbClients = nbClients;
        printMessage()
    }
    
    func printMessage() {
        printData("We have a new employee: \(name), a manager.")
    }
    
    override func annualIncome() -> Double {
        let baseYearlyIncome = (monthlyIncome * Double(12)) * Double(rate)/100
        let clientBonus = Double(_GainFactorClient * nbClients)
        let expenditure = Double(_GainFactorTravel * nbTravelDays)
        return baseYearlyIncome + clientBonus + expenditure
    }
}

extension Manager {
    override var description: String {
//        let a =
//        """
//        Name: \(name), a Manager \n
//        """
        
        let b = """
         He/She travelled \(nbTravelDays) days and
        has brought \(nbClients) new clients.
        His/Her estimated annual income is \(annualIncome())
        """
        return super.description + b
    }
}
