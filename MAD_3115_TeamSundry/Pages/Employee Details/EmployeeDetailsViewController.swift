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

        // Do any additional setup after loading the view.
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
        
        let a = ""
        
        nameLbl.text = "Tilak Acharya"
        typeLbl.text = "An Android Developer"
        
        dataLbl.text = """
        Name: \(a), a \(a)
        Age : \(a)
        
        Employee has a \(a)
        Model : \(a)
        Plate : \(a)
        Color : \(a)
        With a side car
        
        Occupation rate : \(a)
        Annual Income : \(a)
        He/She has corrected
        
        """
        
    }

}
