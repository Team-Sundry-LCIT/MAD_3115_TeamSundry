//
//  Temporary.swift
//  MAD3004_TeamMaple
//

import Foundation

class Temporary:Contract {
    
    private var _hourlySalary:Int=0
    private var _accumulatedHours:Int=0
    
    var hourlySalary:Int{
        get{return _hourlySalary}
        set{_hourlySalary=newValue}
    }
    
    var accumulatedHours:Int{
        get{return _accumulatedHours}
        set{_accumulatedHours=newValue}
    }
    
    init(hourlySalary:Int, accumulatedHours:Int){
        self._hourlySalary = hourlySalary
        self._accumulatedHours = accumulatedHours
    }
    
    override func accumulatedSalary() -> Double {
        let salary = Double(hourlySalary * accumulatedHours)
        return salary
    }
    
    override var description: String {
        let a = """
        he is a temporary employee with \(hourlySalary) hourly salary and he has worked for \(accumulatedHours) hours
        """
        return super.description + a
    }
}

