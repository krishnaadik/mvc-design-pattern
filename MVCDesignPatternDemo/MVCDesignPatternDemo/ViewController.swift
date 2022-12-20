//
//  ViewController.swift
//  MVCDesignPatternDemo
//
//  Created by Mac on 09/11/22.
//

import UIKit

class ViewController: UIViewController{
    
   var employees:[Employee] =  []
    var secondViewController:SecondViewController = SecondViewController()

    @IBOutlet weak var employeeTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        employeeTableView.dataSource = self
        employeeTableView.delegate = self
        
        let uiNib = UINib(nibName: "EmployeeTableViewCell", bundle: nil)
        self.employeeTableView.register(uiNib, forCellReuseIdentifier: "EmployeeTableViewCell")
    }
    
    
    @IBAction func addNewEmployee(_ sender: Any) {
    secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
    secondViewController.delegateOnSecondViewController = self
    navigationController?.pushViewController(secondViewController, animated: true)
       
        
    }
}
    extension ViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employees.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let employeeTableViewCell = self.employeeTableView.dequeueReusableCell(withIdentifier: "EmployeeTableViewCell", for: indexPath) as! EmployeeTableViewCell
        
        
        let eachEmployee = employees[indexPath.row]
        employeeTableViewCell.empIdLabel.text = String(eachEmployee.empId)
        employeeTableViewCell.empFirstNameLabel.text = eachEmployee.empFirstName
        employeeTableViewCell.empLastNameLabel.text = eachEmployee.empLastName
        employeeTableViewCell.empSalaryLabel.text = String(eachEmployee.empSalary)
        
        return employeeTableViewCell
    }
    }

    extension ViewController : UITableViewDelegate{
        func tableView(_tableView: UITableView,heightForRowAt indexPath : IndexPath) -> CGFloat {
            200
        }
    }
    extension ViewController:BackDataPassingProtocol{
        
        
        func passingDataToFirstViewController(employee:Employee){
            let employeeObject = Employee(
                empId: employee.empId,
                empFirstName: employee.empFirstName,
                empLastName: employee.empLastName,
                empSalary: employee.empSalary
            )
            employees.append(employeeObject)
            employeeTableView.reloadData()
        }
    }






