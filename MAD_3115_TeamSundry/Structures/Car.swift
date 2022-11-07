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
    var make: String
    var plate: String
    var color: String    
    var category: String
    
    //defining variable
    var gear:String
    var type:String
    
    var description: String {
        let text = """
                Employee has a \(Self.self)
                \t- Model: \(make)
                \t- Plate: \(plate)
                \t- Colour: \(color)
                \t- Category: \(category)
                \t- type: \(type)
            """
        
        return text
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

