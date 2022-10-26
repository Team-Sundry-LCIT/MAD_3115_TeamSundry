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



