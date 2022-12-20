//
//  SecondViewController.swift
//  MVCDesignPatternDemo
//
//  Created by Mac on 10/11/22.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var empIdTextField: UITextField!
    
    @IBOutlet weak var empFirstNameTextField: UITextField!
    @IBOutlet weak var empLastNameTextField: UITextField!
    @IBOutlet weak var empSalary: UITextField!
    var delegateOnSecondViewController : BackDataPassingProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func clickbtnToaddEmployeeRecord(_ sender: Any) {
        guard let delegate = delegateOnSecondViewController else{
            print("delegate not created")
            return
        }
        let id = self.empIdTextField.text
        let idInt = Int(id!) ?? 0
        
        let empFirstName = self.empFirstNameTextField.text ?? "Default FN"
        let empLastName = self.empLastNameTextField.text ?? "Default LN"
        
        let empSalary = self.empSalary.text
        let empSalaryFloat = Float(empSalary!) ?? 0.0
        
        delegate.passingDataToFirstViewController(
            employee:
                Employee(empId:idInt,
                         empFirstName:empFirstName,
                         empLastName:empLastName,
                         empSalary:empSalaryFloat))
        
        navigationController?.popViewController(animated: true)
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
