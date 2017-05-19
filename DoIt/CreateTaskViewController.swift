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
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let task = Task(context: context)
            
        task.name = taskNameTextfield.text!
        task.important = importantSwitch.isOn
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        // Pop back
        
  //      previousVC.tasks.append(task)
  //      previousVC.tableView.reloadData()
        navigationController!.popViewController(animated: true)
    }
    
}
