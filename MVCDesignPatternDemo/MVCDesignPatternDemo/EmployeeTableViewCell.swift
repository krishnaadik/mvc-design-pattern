//
//  EmployeeTableViewCell.swift
//  MVCDesignPatternDemo
//
//  Created by Mac on 10/11/22.
//

import UIKit

class EmployeeTableViewCell: UITableViewCell {
    @IBOutlet weak var empIdLabel: UILabel!
    @IBOutlet weak var empFirstNameLabel: UILabel!
    @IBOutlet weak var empLastNameLabel: UILabel!
    @IBOutlet weak var empSalaryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
