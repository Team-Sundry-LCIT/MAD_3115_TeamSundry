//
//  Vehicle.swift
//  MAD3004_TeamMaple
//

import Foundation

class Vehicle {
    
    //defining the variables
    private var _make: String = ""
    private var _plate: String = ""
    private var _color: String = ""
    private var _category: String = ""
    
    //defining setter & getter
    var make:String{
        get{return _make}
        set{ _make = newValue }
    }
    var plate:String{
        get{return _plate}
        set{ _plate = newValue }
    }
    var color:String{
        get{return _color}
        set{ _color = newValue }
    }
    var category:String{
        get{return _category}
        set{ _category = newValue }
    }
    
    //empty initialization
    init(){
        self._make = ""
        self._plate = ""
        self._color = ""
        self._category = ""
    }
    
    //initialisation as per test case
    init(_make: String, _plate: String, _color: String, _category: String) {
        self._make = _make
        self._plate = _plate
        self._color = _color
        self._category = _category
    }
    
}

//MARK: Vehicle Extension
extension Vehicle : CustomStringConvertible {
    @objc var description: String {
        let a = """
        \t- make: \(make)
        \t- plate: \(plate)
        \t- colour: \(color)
        \t- category: \(category)
        """
        return a
    }
}

