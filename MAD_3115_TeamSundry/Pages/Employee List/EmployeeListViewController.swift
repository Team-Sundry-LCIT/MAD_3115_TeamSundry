//
//  ViewController.swift
//  MAD_3115_TeamSundry
//

import UIKit

class EmployeeListViewController: UIViewController {

    
    @IBOutlet weak var employeesListtableView: UITableView!
    
    var employeeList = [EmployeeProtocol]()
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        employeesListtableView.delegate = self
        employeesListtableView.dataSource = self
        // Do any additional setup after loading the view.
    }

    @IBAction func addEmployee(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "RegisterForm", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "RegisterFormViewController") as! RegisterFormViewController
        nextViewController.delegate = self
        nextViewController.employeeList = self.employeeList
        navigationController?.pushViewController(nextViewController, animated: true)
    }
}

extension EmployeeListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employeeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = employeesListtableView.dequeueReusableCell(withIdentifier: "EmployeeCell") as? EmployeeListTableViewCell {
            cell.nameLabel?.text = employeeList[indexPath.row].name
            cell.idLabel?.text = employeeList[indexPath.row].employeeID
            cell.avatarImage?.image = UIImage(named: "_Messages-avatar")
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            EmplyeeStruct.names.remove(at: indexPath.row)
            EmplyeeStruct.ids.remove(at: indexPath.row)
            EmplyeeStruct.images.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let storyBoard : UIStoryboard = UIStoryboard(name: "EmployeeDetails", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EmployeeDetails") as! EmployeeDetailsViewController
        nextViewController.delegate = self
        nextViewController.employee = self.employeeList[indexPath.row]
        self.present(nextViewController, animated: true)

    }
    
    func updateEmployeeList(with employees : [EmployeeProtocol]){
        employeeList = employees
        employeesListtableView.reloadData()
 //       saveEmplooyeeList
    }
    
    func saveEmplooyeeList(){
        defaults.set(employeeList, forKey: "SavedEmployeeList")
    }
    
    func getEmplooyeeList(){
        employeeList = defaults.object(forKey: "SavedEmployeeList") as? [EmployeeProtocol] ?? [EmployeeProtocol]()
    }
    
}
