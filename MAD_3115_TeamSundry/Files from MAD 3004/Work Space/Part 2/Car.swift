//
//  Car.swift
//  MAD3004_TeamMaple
//

import Foundation

class Car: Vehicle {
    //defining variable
    private var _gear:String = ""
    private var _type:String = ""
    
    //getter and setter methods
    var gear:String{
        get{return _gear}
        set{_gear = newValue}
    }
    
    var type:String{
        get{return _type}
        set{_type = newValue}
    }
    
    //initialisation
    init(make:String,plate:String,color:String,category:String,gear:String,type:String){
        super.init(_make :make,_plate :plate,_color :color,_category :category)
        self._gear = gear
        self._type = type
    }
}

extension Car {
    override var description: String {
        let a = """
        Employee has a car\n
        """
        
        let b = """
        \n\t- gear type: \(gear)
        \t- type: \(type)
        """
        
        return a + super.description + b
    }
}

