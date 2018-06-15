//
//  ViewController.swift
//  Todoey
//
//  Created by Prasul Surendran on 15/06/18.
//  Copyright © 2018 Prasul Surendran. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    //MARK: Define Variables
    
    let messageArray = ["Go to bathroom", "turn off the shower", "turn off the lights"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    //MARK: Table View datasource methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        cell.textLabel?.text = messageArray[indexPath.row]
        return cell
    }
    
    //MARK:- Define Delegates
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("The row \(indexPath.row) is now selected and the value is \(messageArray[indexPath.row])")
        
        tableView.deselectRow(at: indexPath, animated: true)
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
    }

}

