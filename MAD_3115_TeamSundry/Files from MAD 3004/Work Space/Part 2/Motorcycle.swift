//
//  Motorcycle.swift
//  MAD3004_TeamMaple
//

import Foundation

protocol MotorcycleProtocol {
    var sidecar: Bool { get set }
}

struct Motorcycle: MotorcycleProtocol, VehicleProtocol {
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
        let a = """
        Employee has a motorcycle\n
        """
        
        let b = """
        \n\t- \(sidecar ? "with" : "without") sidecar
        """
        return a + b
    }
}
