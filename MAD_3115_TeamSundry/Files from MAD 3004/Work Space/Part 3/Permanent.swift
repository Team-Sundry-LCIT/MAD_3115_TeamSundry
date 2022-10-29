//
//  Permanent.swift
//  MAD3004_TeamMaple
//

import Foundation
protocol PermanentProtocol  {
    var nbChildren: Int { get set }
    var married: Bool { get set }
    var monthlySalary: Double { get set }
    var bonusPerChildPerMonth: Int { get set }
    var accumulatedDays: Int { get set }
    
}

class Permanent: PermanentProtocol {
    
    var nbChildren: Int = 0
    var married: Bool = false
    var monthlySalary: Double = 0.0
    var bonusPerChildPerMonth: Int = 0
    var accumulatedDays: Int = 0
    
    var description: String {
        let text = """
        he \(married ? "is" : "is not") married and he/she has \(nbChildren) children.
        He/She has worked for \(accumulatedDays) days and upon contract his/her monthly salary is \(monthlySalary).
        """
        return text
    }
    
    init(nbChildren: Int, married: Bool, monthlySalary: Double, bonusPerChildPerMonth: Int, accumulatedDays: Int) {
        self.nbChildren = nbChildren
        self.married = married
        self.monthlySalary = monthlySalary
        self.bonusPerChildPerMonth = bonusPerChildPerMonth
        self.accumulatedDays = accumulatedDays
    }
    
    func accumulatedSalary() -> Double {
        var childBonus = 0
        var cumulativeSalary = 0.0
        if (married && nbChildren > 0){
            childBonus = bonusPerChildPerMonth * nbChildren
        }
        let salary = monthlySalary + Double(childBonus)
        cumulativeSalary = (salary / 20) * Double(accumulatedDays)
        return cumulativeSalary
    }
}
