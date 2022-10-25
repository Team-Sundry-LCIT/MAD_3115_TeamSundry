//
//  Tester.swift
//  MAD3004_TeamMaple
//

import Foundation

class Tester: Employee {
    
    private var _nbBugs: Int=0
    private let _GainFactorError = 10
    
    var nbBugs: Int {
        get { return _nbBugs }
        set { _nbBugs = newValue }
    }
    
    func printMessage() {
        printData("We have a new employee: \(name), a tester")
    }
    
    init(name: String, birthYear: Int,nbBugs: Int,rate:Int=100, employeeVehicle: Vehicle?=nil) {
        super.init(name: name, birthYear: birthYear, rate: rate,employeeVehicle: employeeVehicle)
        self.nbBugs = nbBugs;
        printMessage()
    }
    
    override func annualIncome() -> Double {
        let baseYearlyIncome = (monthlyIncome * Double(12)) * Double(rate)/100
        let bonus = Double(_GainFactorError * nbBugs)
        return baseYearlyIncome + bonus
    }
}

extension Tester {
    override var description: String {
//        let a =
//        """
//        Name: \(name), a Tester \n
//        """
        
        let b = """
         and corrected \(nbBugs) bugs.
        His/Her estimated annual income is \(annualIncome())
        """
        return   super.description + b
    }
}

