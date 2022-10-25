//
//  Motorcycle.swift
//  MAD3004_TeamMaple
//

import Foundation

class Motorcycle: Vehicle {
    //defining variable
    private var _sidecar:Bool = false
    
    //initialisations
    init(make:String, plate:String, color:String ,category:String ,sidecar:Bool = false){
        super.init(_make:make,_plate:plate,_color:color ,_category:category)
        self._sidecar=sidecar
    }
    
    var sidecar:Bool{
        get{return _sidecar}
        set{_sidecar=newValue}
    }
}

extension Motorcycle {
    override var description: String {
        let a = """
        Employee has a motorcycle\n
        """
        
        let b = """
        \n\t- \(sidecar ? "with" : "without") sidecar
        """
        return a + super.description + b
    }
}

