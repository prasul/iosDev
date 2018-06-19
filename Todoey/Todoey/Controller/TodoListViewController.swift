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
    
    var messageArray = [ToDoModelData]()
//    var defaults = UserDefaults.standard
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        if let items = defaults.array(forKey: "ToDoList") as? [String] {
//            messageArray = items
//        }
        print(dataFilePath as Any)
        
        loadData()
        
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
        cell.textLabel?.text = messageArray[indexPath.row].itemName
//        if messageArray[indexPath.row].itemDone == true {
//            cell.accessoryType = .checkmark
//        }else {
//            cell.accessoryType = .none
//        } The following line will cut short this if statement and is known as ternary operator

        //MARK: Terenary Operator
        cell.accessoryType = messageArray[indexPath.row].itemDone ? .checkmark : .none
        
        return cell
    }
    
    //MARK:- Define Delegates
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //        print("The row \(indexPath.row) is now selected and the value is \(messageArray[indexPath.row])")
        
        tableView.deselectRow(at: indexPath, animated: true)
        messageArray[indexPath.row].itemDone = !messageArray[indexPath.row].itemDone
        saveData()
        
//       This line of code will cause duplicate heck marks
//        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
//            tableView.cellForRow(at: indexPath)?.accessoryType = .none
//        }else {
//            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
//        }
    }
    
    //MARK:- Add new items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textFieldData = UITextField()
        let alertItem = UIAlertController(title: "Add Items", message: "Add new items to ToDo", preferredStyle: .alert)
        alertItem.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new ToDo"
            textFieldData = alertTextField
        }
        let action = UIAlertAction(title: "Add new Item", style: .default) { (buttonPressed) in
//            self.messageArray.append(String(textFieldData.text!))
            let newItem = ToDoModelData()
            newItem.itemName = textFieldData.text!
            self.messageArray.append(newItem)
            self.saveData()
//            self.defaults.set(self.messageArray, forKey: "ToDoList")
        }
        alertItem.addAction(action)
        present(alertItem, animated: true, completion: nil)
    }
    
    //MARK: Configuretable View
    func configureTableView(){
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 120.0
    }
    
    //MARK: Retreive messages
    func loadData() {
        if let data = try? Data(contentsOf: dataFilePath!){
            let decoder = PropertyListDecoder()
            do {
                messageArray = try decoder.decode([ToDoModelData].self, from: data)
            }catch{
                print("Error Decoding data : \(error)")
            }
            
        }
    }
    
    //MARK: Save data method
    func saveData(){
        let encoder = PropertyListEncoder()
        do {
            let data = try encoder.encode(messageArray)
            try data.write(to: dataFilePath!)
        } catch {
            print("Error encoding data : \(error)")
        }
            tableView.reloadData()
    }
    
    //MARK: Thats All folks data here
    
    
    
    
    
}

