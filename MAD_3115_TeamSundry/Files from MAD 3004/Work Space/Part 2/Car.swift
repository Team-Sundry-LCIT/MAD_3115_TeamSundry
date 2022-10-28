//
//  Car.swift
//  MAD3004_TeamMaple
//

import Foundation

protocol CarProtocol{
    var gear:String { get set }
    var type:String { get set }
}

struct Car: CarProtocol, VehicleProtocol {
    //defining variable
    var gear:String
    var type:String
    
    var description: String {
        let a = """
        Employee has a car\n
        """
        
        let b = """
        \n\t- gear type: \(gear)
        \t- type: \(type)
        """
        
        return a +
//        super.description +
        b
    }
    
    //initialisation
    init(make:String,plate:String,color:String,category:String,gear:String,type:String){
        self.make = make
        self.plate = plate
        self.color = color
        self.category = category
        self.gear = gear
        self.type = type
    }
}

