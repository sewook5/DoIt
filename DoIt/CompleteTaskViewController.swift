//
//  CompleteTaskViewController.swift
//  DoIt
//
//  Created by Matthew Oh on 5/19/17.
//  Copyright © 2017 BB Inc. All rights reserved.
//

import UIKit

class CompleteTaskViewController: UIViewController {
    
    var task : Task? = nil
    var previousVC = TasksViewController()
    
    @IBOutlet var taskLabel: UILabel!
    
    @IBAction func completeTapped(_ sender: Any) {
     //   previousVC.tasks.remove(at: previousVC.selectedIndex)
     //   previousVC.tableView.reloadData()
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        context.delete(task!)
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        navigationController!.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if task!.important {
            taskLabel.text = "❗️ \(task!.name!)"
        } else {
            taskLabel.text = task!.name!
        }
    }
    
}
