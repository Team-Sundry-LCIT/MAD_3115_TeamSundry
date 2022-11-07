//
//  Motorcycle.swift
//  MAD3004_TeamMaple
//

import Foundation

protocol MotorcycleProtocol {
    var sidecar: Bool { get set }
}

struct Motorcycle: MotorcycleProtocol, VehicleProtocol {
    var make: String
    var plate: String
    var color: String
    var category: String    
    //defining variable
    var sidecar: Bool = false
    
    //initialisations
    init(make: String, plate: String, color:  String, category: String, sidecar: Bool = false){
        self.make = make
        self.plate = plate
        self.color = color
        self.category = category
        self.sidecar = sidecar
    }
}

extension Motorcycle: CustomStringConvertible {
    var description: String {
        let text = """
                Employee has a \(Self.self)
                \t- Model: \(make)
                \t- Plate: \(plate)
                \t- Colour: \(color)
                \t- Category: \(category)
                \t- \(sidecar ? "with" : "without") a sidecar
        """
        return text
    }
}
