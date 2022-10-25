//
//  management.swift
//  FT_EmployeeContract
//
//  Created by Mohammad Kiani on 2019-10-23.
//  Copyright © 2019 mohammadkiani. All rights reserved.
//
import Foundation

struct Management {
    static let workingDaysPerMonth = 20.0
    var employees = [Employee]()
    let m1 = Motorcycle(make: "Kawasaki", plate: "Custom Plate", color: "Yellow", category: "Race Motorcycle", sidecar: false)
    let m2 = Motorcycle(make: "Honda", plate: "Custom Plate", color: "Black", category: "Not for Race", sidecar: true)
    let vt1 = Car(make: "Lamborghini", plate: "Custom Plate", color: "White", category: "Family", gear: "Manual", type: "Sport")
    let vt2 = Car(make: "BMW", plate: "Custom Plate", color: "Black", category: "Family", gear: "Automatic", type: "Sedan")
    let vt3 = Car(make: "Renault Clio", plate: "Custom Plate", color: "Blue", category: "Family", gear: "Manual", type: "Hatchback")
    let vt4 = Car(make: "Mazda", plate: "Custom Plate", color: "White", category: "Family", gear: "Automatic", type: "SUV")
    
    mutating func hire_test1() {
        employees.append(Manager(name: "Serge", birthYear: 1985, nbClients: 30, nbTravelDays: 4))
        employees.append(Manager(name: "Cindy", birthYear: 1974, nbClients: 20, nbTravelDays: 6, rate: 80))
        employees.append(Programmer(name: "Paul", birthYear: 1993, nbProjects: 3, rate: 75))
        employees.append(Tester(name: "Pierre", birthYear: 1987, nbBugs: 124, rate: 50))
        employees.append(Programmer(name: "Matt", birthYear: 1981, nbProjects: 5, rate: 110))
        employees.append(Programmer(name: "Sarah", birthYear: 1986, nbProjects: 3))
    }
    mutating func hire_test2() {
        employees = []
        employees.append(Manager(name: "Serge", birthYear: 1985, nbClients: 30, nbTravelDays: 4, employeeVehicle: vt1))
        employees.append(Manager(name: "Cindy", birthYear: 1974, nbClients: 20, nbTravelDays: 6, rate: 80, employeeVehicle: vt2))
        employees.append(Programmer(name: "Paul", birthYear: 1993, nbProjects: 3, rate: 75, employeeVehicle: m1))
        employees.append(Tester(name: "Pierre", birthYear: 1987, nbBugs: 124, rate: 50, employeeVehicle: m2))
        employees.append(Programmer(name: "Matt", birthYear: 1981, nbProjects: 5, rate: 110, employeeVehicle: vt4))
        employees.append(Programmer(name: "Sarah", birthYear: 1986, nbProjects: 3, employeeVehicle: vt3))
        for item in employees {
            print("-------------------------")
            print(item)
            print("-------------------------")
        }
    }
    mutating func hire_test3() {
        employees = []
        let Serge = Manager(name: "Serge", birthYear: 1985, nbClients: 30, nbTravelDays: 4, employeeVehicle: vt1)
        let Cindy = Manager(name: "Cindy", birthYear: 1974, nbClients: 20, nbTravelDays: 6, rate: 80, employeeVehicle: vt2)
        let Paul = Programmer(name: "Paul", birthYear: 1993, nbProjects: 3, rate: 75, employeeVehicle: m1)
        let Pierre = Tester(name: "Pierre", birthYear: 1987, nbBugs: 124, rate: 50, employeeVehicle: m2)
        let Matt = Programmer(name: "Matt", birthYear: 1981, nbProjects: 5, rate: 110, employeeVehicle: vt4)
        let Sarah = Programmer(name: "Sarah", birthYear: 1986, nbProjects: 3, employeeVehicle: vt3)
        
        let p1 = Permanent(nbChildren: 2, married: true, monthlySalary: 6000, bonusPerChildPerMonth: 200, accumulatedDays: 17)
        let p2 = Permanent(nbChildren: 3, married: false, monthlySalary: 5000, bonusPerChildPerMonth: 150, accumulatedDays: 19)
        let t1 = Temporary(hourlySalary: 60, accumulatedHours: 30)
        let t2 = Temporary(hourlySalary: 50, accumulatedHours: 60)
        let p3 = Permanent(nbChildren: 1, married: true, monthlySalary: 4000, bonusPerChildPerMonth: 100, accumulatedDays: 20)
        let p4 = Permanent(nbChildren: 4, married: true, monthlySalary: 4500, bonusPerChildPerMonth: 100, accumulatedDays: 19)
        Serge.signContract(contract: p1)
        Cindy.signContract(contract: p2)
        Paul.signContract(contract: t1)
        Matt.signContract(contract: t2)
        Pierre.signContract(contract: p3)
        Sarah.signContract(contract: p4)
        employees.append(Serge); employees.append(Cindy); employees.append(Paul); employees.append(Pierre); employees.append(Matt); employees.append(Sarah)
        for item in employees {
            print("-------------------------")
            print(item)
            print("-------------------------")
        }
        print("-------------------------")
        print("Contracts: ")
        print("-------------------------")
        for item in employees {
            if let contract = item.contract {
                print(item.contractInfo(), contract)
            }
        }
        print("-------------------------")
        let p5 = Permanent(nbChildren: 1, married: true, monthlySalary: 5000, bonusPerChildPerMonth: 200, accumulatedDays: 30)
        Matt.signContract(contract: p5)
        print("-------------------------")
        print("Contracts: ")
        print("-------------------------")
        for item in employees {
            if let contract = item.contract {
                print(item.contractInfo(), contract)
            }
        }
        print("-------------------------")
    }
    
    
}
