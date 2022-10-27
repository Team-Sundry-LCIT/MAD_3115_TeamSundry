//
//  Temporary.swift
//  MAD3004_TeamMaple
//

import Foundation

protocol TemporaryProtocol {
    var hourlySalary:Int { get set }
    var accumulatedHours:Int { get set }
}

struct Temporary:ContractProtocol, CustomStringConvertible {
    
    private var hourlySalary:Int=0
    private var accumulatedHours:Int=0
    
    init(hourlySalary:Int, accumulatedHours:Int){
        self.hourlySalary = hourlySalary
        self.accumulatedHours = accumulatedHours
    }
    
    func accumulatedSalary() -> Double {
        let salary = Double(hourlySalary * accumulatedHours)
        return salary
    }
    
    var description: String {
        let a = """
        he is a temporary employee with \(hourlySalary) hourly salary and he has worked for \(accumulatedHours) hours
        """
        return  a
    }
}

