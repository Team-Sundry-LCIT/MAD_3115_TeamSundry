//
//  Contract.swift
//  MAD3004_TeamMaple
//

import Foundation

protocol ContractProtocol {
    func accumulatedSalary() -> Double
}

protocol EmployeeContract : EmployeeProtocol{
    mutating func signContract(contract : ContractProtocol)
}

extension EmployeeContract {
    mutating func signContract(contract: ContractProtocol) {
        monthlyIncome = contract.accumulatedSalary()
        self.contract = contract
   }
    
    func contractInfo() -> String {
        return "\(name) is a \(Self.self) \n"
    }
}
