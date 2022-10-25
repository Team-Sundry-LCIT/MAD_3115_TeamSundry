//
//  Programmer.swift
//  MAD3004_TeamMaple
//

import Foundation

class Programmer: Employee {
    
    private var _nbProjects: Int=0
    
    private let _GainFactorProjjects = 200
    
    var nbProjects: Int {
        get { return _nbProjects }
        set { _nbProjects = newValue }
    }
    
    func printMessage() {
        printData("We have a new employee: \(name), a programmer");
    }
    
    init(name: String, birthYear: Int,nbProjects: Int,rate:Int=100, employeeVehicle: Vehicle?=nil) {
        super.init(name: name, birthYear: birthYear, rate: rate,employeeVehicle: employeeVehicle)
        self._nbProjects = nbProjects;
        printMessage()
    }
    
    override func annualIncome() -> Double {
        let baseYearlyIncome = (monthlyIncome * Double(12)) * Double(rate)/100
        let bonus = Double(_GainFactorProjjects * nbProjects)
        return baseYearlyIncome + bonus
    }
}

extension Programmer {
    override var description: String {
//        let a =
//        """
//        Name: \(name), a Programmer \n
//        """
        
        let b = """
         and completed \(nbProjects) projects.
        His/Her estimated annual income is \(annualIncome())
        """
        return super.description + b
    }
}

