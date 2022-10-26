//
//  Tester.swift
//  MAD3004_TeamMaple
//

import Foundation

protocol TesterProtocol  {
    var nbBugs: Int { get set }
    let gainFactorError: Int { get }
    
    func annualIncome() -> Double
}

struct Tester: TesterProtocol, EmployeeProtocol {
    
    var name: String
    var birthYear: Int
    var age: Int
    var monthlyIncome: Double
    var rate: Int
    var employeeVehicle: Vehicle?
    var contract: Contract?
    var nbBugs: Int=0
    let GainFactorError = 10

    
    func printMessage() {
        printData("We have a new employee: \(name), a tester")
    }
    
    init(name: String, birthYear: Int,nbBugs: Int,rate:Int=100,employeeVehicle: Vehicle?=nil){
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
        let bonus = Double(_GainFactorError * nbBugs)
        return baseYearlyIncome + bonus
    }
    
    func calculateAge(birthYear: Int) -> Int {
        if birthYear > 0 {
            let date = Date()
            let currentYear = Calendar.current.component(.year, from: date)
            return currentYear - birthYear
         }
         return 0
    }
    
    func printData(_ msg :String){
        print(msg)
    }
}

extension Tester {
    var description: String {
        let a =
        """
        Name: \(name), a Tester \n
        """
        
        let b = """
         and corrected \(nbBugs) bugs.
        His/Her estimated annual income is \(annualIncome())
        """
        return a + b
    }
}

