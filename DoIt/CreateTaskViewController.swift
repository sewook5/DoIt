//
//  CreateTaskViewController.swift
//  DoIt
//
//  Created by Matthew Oh on 5/18/17.
//  Copyright © 2017 BB Inc. All rights reserved.
//

import UIKit

class CreateTaskViewController: UIViewController {

    
    @IBOutlet var taskNameTextfield: UITextField!
    
    @IBOutlet var importantSwitch: UISwitch!
    
    var previousVC = TasksViewController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func addTapped(_ sender: Any) {
        // Create a task from the outlet information
        
        let task = Task()
        task.name = taskNameTextfield.text!
        task.important = importantSwitch.isOn
        
        // Add new task to array in previous viewController
        
        previousVC.tasks.append(task)
        previousVC.tableView.reloadData()
        navigationController!.popViewController(animated: true)
    }
    
}
