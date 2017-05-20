//
//  TasksViewController.swift
//  DoIt
//
//  Created by Matthew Oh on 5/18/17.
//  Copyright © 2017 BB Inc. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
    var tasks : [Task] = []
 //   var selectedIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //        tasks = makeTasks()
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getTasks()
        tableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        if task.important {
            cell.textLabel?.text = "❗️ \(task.name!)"
        } else {
            cell.textLabel?.text = task.name!
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
   //     selectedIndex = indexPath.row
        let task = tasks[indexPath.row]
        performSegue(withIdentifier: "selectTaskSegue", sender: task)
    }
    
    /*  //Replaced with the use of CoreData
     func makeTasks() -> [Task] {
     let task1 = Task()
     task1.name = "Walk the dog"
     task1.important = false
     
     let task2 = Task()
     task2.name = "Buy cheese"
     task2.important = true
     
     let task3 = Task()
     task3.name = "Clean the floor"
     task3.important = true
     
     return [task1, task2, task3]
     }
     */
    @IBAction func plusTapped(_ sender: Any) {
        performSegue(withIdentifier: "addSegue", sender: nil)
    }
    
    func getTasks() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            tasks = try context.fetch(Task.fetchRequest()) as!  [Task]
        } catch {
            print("OOPS WE HAVE AN ERROR")
        }
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        /*
         if segue.identifier=="addSegue" {
         let nextVC = segue.destination as! CreateTaskViewController
         nextVC.previousVC = self
         } */
        
        if segue.identifier=="selectTaskSegue" {
            let nextVC = segue.destination as! CompleteTaskViewController
            nextVC.task = sender as? Task
   //         nextVC.previousVC = self
        }
    }
}

