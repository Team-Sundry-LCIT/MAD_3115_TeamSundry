//
//  EmployeeDetailsViewController.swift
//  MAD_3115_TeamSundry
//
//  Created by Alice’z Poy on 2022-10-28.
//

import UIKit

class EmployeeDetailsViewController: UIViewController {

    @IBOutlet weak var nameLbl: UILabel!
    
    @IBOutlet weak var typeLbl: UILabel!
    
    @IBOutlet weak var dataLbl: UILabel!
    
    weak var delegate: EmployeeListViewController?
    var employee:EmployeeProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        populateData()
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func populateData(){
        
        guard let employee = employee , let employeeVehicle = employee.employeeVehicle else {
            return
        }
        
        nameLbl.text = "\(String(describing: employee.name))"
        typeLbl.text = "An \(String(describing: employee.employeeID))"
        
        dataLbl.text = """
        Name: \(String(describing: employee.name)), a \(String(describing: type(of:employee)) )
        Age : \(String(describing: employee.age) )
        
        Employee has a \(String(describing: type(of:employeeVehicle)))
        Model : \(String(describing: employeeVehicle.category))
        Plate : \(String(describing: employeeVehicle.plate))
        Color : \(String(describing: employeeVehicle.color))
        With a side car
        
        Occupation rate : \(String(describing: employee.monthlyIncome))
        Annual Income : \(String(describing: employee.annualIncome()))
        He/She has corrected
        
        """
    
        
    }

}
