//
//  ViewController.swift
//  MAD_3115_TeamSundry
//

import UIKit

class EmployeeListViewController: UIViewController {

    
    @IBOutlet weak var employeesListtableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        employeesListtableView.delegate = self
        employeesListtableView.dataSource = self
        // Do any additional setup after loading the view.
    }

    @IBAction func addEmployee(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "RegisterForm", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "registerForm")
        self.present(nextViewController, animated:true, completion:nil)
    }
}

extension EmployeeListViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return EmplyeeStruct.names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = employeesListtableView.dequeueReusableCell(withIdentifier: "EmployeeCell") as? EmployeeListTableViewCell {
            cell.nameLabel?.text = EmplyeeStruct.names[indexPath.row]
            cell.idLabel?.text = EmplyeeStruct.ids[indexPath.row]
            cell.avatarImage?.image = UIImage(named: EmplyeeStruct.images[indexPath.row])
            return cell
        }
        
        return UITableViewCell()
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
    
    
}
