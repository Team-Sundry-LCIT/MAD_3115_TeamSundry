//
//  Contract.swift
//  MAD3004_TeamMaple
//
//  Created by Tilak Acharya on 2022-10-07.
//

import Foundation

class Contract: CustomStringConvertible {
    var description: String {
        return ""
    }
    
    func accumulatedSalary() -> Double {
        return 0.0
    }
}

protocol EmployeeContract {
    var contract : Contract? { get set }
    
    func signContract(contract : Contract)
    func contractInfo() -> String
}

extension Employee : EmployeeContract {
    func signContract(contract: Contract) {
        monthlyIncome = contract.accumulatedSalary()
        self.contract = contract
    }
    
    func contractInfo() -> String {
        if type(of: self) == Manager.self {
            return "\(name) is a manager."
        } else if type(of: self) == Programmer.self {
            return "\(name) is a programmer."
        } else if type(of: self) == Tester.self {
            return "\(name) is a tester."
        }
        
        return "\(name)"
    }
}
