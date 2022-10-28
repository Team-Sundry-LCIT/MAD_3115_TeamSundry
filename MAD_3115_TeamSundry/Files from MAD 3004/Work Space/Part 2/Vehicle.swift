//
//  Vehicle.swift
//  MAD3004_TeamMaple
//

import Foundation

protocol VehicleProtocol{
    var make:String { get set }
    var plate:String { get set }
    var color:String { get set }
    var category:String { get set }
}

struct Vehicle : VehicleProtocol {
    
    //defining the variables
    var make:String
    var plate:String
    var color:String
    var category:String
    
    //empty initialization
    init(){
        self.make = ""
        self.plate = ""
        self.color = ""
        self.category = ""
    }
    
    //initialisation as per test case
    init(_make: String, _plate: String, _color: String, _category: String) {
        self.make = _make
        self.plate = _plate
        self.color = _color
        self.category = _category
    }
    
}

//MARK: Vehicle Extension
extension Vehicle : CustomStringConvertible {
    var description: String {
        """
        \t- make: \(make)
        \t- plate: \(plate)
        \t- colour: \(color)
        \t- category: \(category)
        """
    }
}

