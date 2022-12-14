//
//  ViewController.swift
//  MAD_3115_TeamSundry
//

import UIKit

class EmployeeListViewController: UIViewController {
    
    @IBOutlet weak var employeesListtableView: UITableView!
    
    var employeeList = [EmployeeProtocol]()
    let defaults = UserDefaults.standard
    
    var searchEmployee = [EmployeeProtocol]()
    var searching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        employeesListtableView.delegate = self
        employeesListtableView.dataSource = self
    }

    @IBAction func addEmployee(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "RegisterForm", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "RegisterFormViewController") as! RegisterFormViewController
        nextViewController.delegate = self
        nextViewController.employeeList = self.employeeList
        navigationController?.pushViewController(nextViewController, animated: true)
    }
}

extension EmployeeListViewController: UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return searchEmployee.count
        } else {
            return employeeList.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = employeesListtableView.dequeueReusableCell(withIdentifier: "EmployeeCell") as? EmployeeListTableViewCell {
            let list = searching ? searchEmployee : employeeList
            cell.nameLabel?.text = "Name : " + list[indexPath.row].name
            cell.idLabel?.text =  "ID : " + list[indexPath.row].employeeID
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
            var emplyee : EmployeeProtocol
            if searching {
                emplyee = searchEmployee[indexPath.row]
                searchEmployee.remove(at: indexPath.row)
            }else{
                emplyee = employeeList[indexPath.row]
                employeeList.remove(at: indexPath.row)
            }
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.reloadData()
            removeEmployee(selectedSmployee: emplyee)
    
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let list = searching ? searchEmployee : employeeList
        let storyBoard : UIStoryboard = UIStoryboard(name: "EmployeeDetails", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EmployeeDetails") as! EmployeeDetailsViewController
        nextViewController.delegate = self
        nextViewController.employee = list[indexPath.row]
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
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText != "" {
            searchEmployee = employeeList.filter { $0.name.lowercased().contains(searchText.lowercased()) || $0.employeeID.lowercased().contains(searchText.lowercased()) }
            searching = true
        } else {
            searching = false
        }
        employeesListtableView.reloadData()
    }
    
    private func removeEmployee(selectedSmployee : EmployeeProtocol){
        employeeList.removeAll(where: {$0.employeeID == selectedSmployee.employeeID})
        searchEmployee.removeAll(where: {$0.employeeID == selectedSmployee.employeeID})
    }
}
