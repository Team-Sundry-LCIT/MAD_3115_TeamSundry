//
//  Contract.swift
//  MAD3004_TeamMaple
//

import Foundation

protocol ContractProtocol {
    func accumulatedSalary() -> Double
}

protocol EmployeeContract {
    var contract: ContractProtocol? {get set}
    
    mutating func signContract(contract : ContractProtocol)
}

extension Employee: EmployeeContract{
    
     mutating func signContract(contract: ContractProtocol) {
         monthlyIncome = contract.accumulatedSalary()
         self.contract = contract
    }
        
    func contractInfo() -> String {
        return "\(name)"
    }
}

extension Tester: EmployeeContract{
    
    mutating func signContract(contract: ContractProtocol) {
        monthlyIncome = contract.accumulatedSalary()
        self.contract = contract
   }
       
    func contractInfo() -> String {
        return "\(name) is a tester."
    }
}

extension Programmer: EmployeeContract{
    
    mutating func signContract(contract: ContractProtocol) {
        monthlyIncome = contract.accumulatedSalary()
         self.contract = contract
   }
       
    func contractInfo() -> String {
        return "\(name) is a programmer."
    }
}

extension Manager: EmployeeContract{

    mutating func signContract(contract: ContractProtocol) {
        monthlyIncome = contract.accumulatedSalary()
         self.contract = contract
   }

    func contractInfo() -> String {
        return "\(name) is a manager."        
    }
}
