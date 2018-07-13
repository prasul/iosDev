//
//  CategoryViewController.swift
//  Todoey
//
//  Created by Prasul Surendran on 05/07/18.
//  Copyright © 2018 Prasul Surendran. All rights reserved.
//

import UIKit
//import CoreData
import RealmSwift

class CategoryViewController: UITableViewController {
    
    let realm = try! Realm()
    //MARK: Defining variables.
    var categories: Results<Category>?
    //   COREDATA:  let contextItem =  (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
//var categoryArray = [Category]()
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCategories()
        print(Realm.Configuration.defaultConfiguration.fileURL!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
      return categories?.count ?? 1
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        cell.textLabel?.text = categories?[indexPath.row].name ?? "No categories found"
        return cell
    }
    //MARK: - Table View delegate methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItems", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TodoListViewController
        print(tableView.indexPathForSelectedRow!)
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedCategory = categories?[indexPath.row]
        }
        
    }
    //MARK: - Data Manipulation Methods
//   This is the method used to save data when using core data
//    func saveData(){
//        do {
//            try contextItem.save()
//        } catch {
//            print("Error saving data: \(error)")
//        }
//        tableView.reloadData()
//    }
    // The following method is used to save data using realm
    
    func save(category: Category){
        do {
            try realm.write {
                realm.add(category)
            }
        }catch {
            print("Error saving data : \(error)")
        }
        tableView.reloadData()
    }
    
    //MARK: Data functions
// CoreDATA function here
//    func loadData(with fetchItems: NSFetchRequest<Category> = Category.fetchRequest()){
//        do {
//            categoryArray = try contextItem.fetch(fetchItems)
//        }catch {
//            print("Unable to fetch items : \(error)")
//        }
//        tableView.reloadData()
//    }
    
    
    func loadCategories(){
        categories = realm.objects(Category.self)
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
// This method for coredata            let newItem = Category(context: self.contextItem)
            let newItem = Category()
            newItem.name = textFieldData.text!
//not needed for realm as it autoupdates            self.categoryArray.append(newItem)
            self.save(category: newItem)
            //            self.defaults.set(self.messageArray, forKey: "ToDoList")
        }
        alertItem.addAction(action)
        present(alertItem, animated: true, completion: nil)
    }
    
}
