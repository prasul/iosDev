//
//  CategoryViewController.swift
//  Todoey
//
//  Created by Prasul Surendran on 05/07/18.
//  Copyright © 2018 Prasul Surendran. All rights reserved.
//

import UIKit
import CoreData

class CategoryViewController: UITableViewController {
    //MARK: Defining variables.
    var categoryArray = [Category]()
    let contextItem =  (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return categoryArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        cell.textLabel?.text = categoryArray[indexPath.row].name
        return cell
    }
    //MARK: - Table View delegate methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Row got selected \(categoryArray[indexPath.row].name!)")
        performSegue(withIdentifier: "goToItems", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TodoListViewController
        print(tableView.indexPathForSelectedRow!)
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedCategory = categoryArray[indexPath.row]
            print("Selected indexpath is \(categoryArray[indexPath.row].name!)")
        }
        
    }
    //MARK: - Data Manipulation Methods
    
    func saveData(){
        do {
            try contextItem.save()
        } catch {
            print("Error saving data: \(error)")
        }
        tableView.reloadData()
    }
    
    //MARK: Data functions
    
    func loadData(with fetchItems: NSFetchRequest<Category> = Category.fetchRequest()){
        do {
            categoryArray = try contextItem.fetch(fetchItems)
        }catch {
            print("Unable to fetch items : \(error)")
        }
        tableView.reloadData()
    }
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textFieldData = UITextField()
        let alertItem = UIAlertController(title: "Add Category", message: "Enter your category name", preferredStyle: .alert)
        alertItem.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new category"
            textFieldData = alertTextField
        }
        let action = UIAlertAction(title: "Add new category", style: .default) { (buttonPressed) in
            let newItem = Category(context: self.contextItem)
            newItem.name = textFieldData.text!
            self.categoryArray.append(newItem)
            self.saveData()
            //            self.defaults.set(self.messageArray, forKey: "ToDoList")
        }
        alertItem.addAction(action)
        present(alertItem, animated: true, completion: nil)
    }
    
}
