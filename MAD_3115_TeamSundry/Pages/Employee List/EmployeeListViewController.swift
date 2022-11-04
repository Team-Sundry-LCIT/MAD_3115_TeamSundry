//
//  ViewController.swift
//  MAD_3115_TeamSundry
//

import UIKit

class EmployeeListViewController: UIViewController {

    
    @IBOutlet weak var employeesListtableView: UITableView!
    var employeesList  : [String] = ["Student A", "Student B", "Student C", "Student D", "Student E"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        employeesListtableView.delegate = self
        employeesListtableView.dataSource = self
        // Do any additional setup after loading the view.
    }

}

extension EmployeeListViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TableItems.names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = employeesListtableView.dequeueReusableCell(withIdentifier: "EmployeeCell") as? EmployeeListTableViewCell {
            cell.nameLabel?.text = TableItems.names[indexPath.row]
            cell.idLabel?.text = TableItems.ids[indexPath.row]
            cell.avatarImage?.image = UIImage(named: TableItems.images[indexPath.row])
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        //return indexPath.row % 2 == 0 ? false : true
        //=> cannot delete row 1,3,5,...
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            
            employeesList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    
}
