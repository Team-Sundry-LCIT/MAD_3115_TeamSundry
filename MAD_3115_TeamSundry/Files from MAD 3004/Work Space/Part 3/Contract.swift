//
//  Contract.swift
//  MAD3004_TeamMaple
//

import Foundation

protocol ContractProtocol {
    func accumulatedSalary() -> Double
}

protocol EmployeeContract : EmployeeProtocol{
    mutating func signContract(contract :   ContractProtocol)
}

extension EmployeeContract {
    mutating func signContract(contract:   ContractProtocol) {
        monthlyIncome = contract.accumulatedSalary()
        self.contract = contract
   }
}

extension Employee: EmployeeContract{
    func contractInfo() -> String {
        return "\(name)"
    }
}

extension Tester: EmployeeContract{
    func contractInfo() -> String {
        return "\(name) is a tester."
    }
}

extension Programmer: EmployeeContract{
    func contractInfo() -> String {
        return "\(name) is a programmer."
    }
}

extension Manager: EmployeeContract{
    func contractInfo() -> String {
        return "\(name) is a manager."        
    }
}
