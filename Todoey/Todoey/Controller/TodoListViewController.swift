//
//  ViewController.swift
//  Todoey
//
//  Created by Prasul Surendran on 15/06/18.
//  Copyright © 2018 Prasul Surendran. All rights reserved.
//

import UIKit
//import CoreData
import RealmSwift
class TodoListViewController: UITableViewController {
    
    //MARK: Define Variables
    let realm = try! Realm()
    var todoItems: Results<Item>?
    var selectedCategory : Category? {
        didSet{
            loadData()
        }
    }
    //    var defaults = UserDefaults.standard
    //    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")
    //CORE DATA    let contextItem =  (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //        if let items = defaults.array(forKey: "ToDoList") as? [String] {
        //            messageArray = items
        //        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: Table View datasource methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoItems?.count ?? 1
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        if let item = todoItems?[indexPath.row]{
            cell.textLabel?.text = item.itemName
            cell.accessoryType = item.itemDone ? .checkmark : .none
        }else{
            cell.textLabel?.text = "No Items Found"
        }
        
        //        if messageArray[indexPath.row].itemDone == true {
        //            cell.accessoryType = .checkmark
        //        }else {
        //            cell.accessoryType = .none
        //        } The following line will cut short this if statement and is known as ternary operator
        
        //MARK: Terenary Operator
        
        return cell
    }
    
    //MARK:- Define Delegates
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //        print("The row \(indexPath.row) is now selected and the value is \(messageArray[indexPath.row])")
        if let item = todoItems?[indexPath.row]{
            do {
                try realm.write {
                    //realm.delete(item) to delete an item in realm
                    item.itemDone = !item.itemDone
                }
            }catch{
                print("Error saving done status : \(error)")
            }
        }
        tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
        //      The following lines of codes to delete an item off from core data
        //          contextItem.delete(messageArray[indexPath.row])
        //          messageArray.remove(at: indexPath.row)
        
        //        messageArray[indexPath.row].itemDone = !messageArray[indexPath.row].itemDone
        //        saveData(items: newItem)
        
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
            //            let newItem = ToDoModelData()
            //            CORE DATA: let newItem = ToDoModelData(context: self.contextItem)
            
            if let currentCategory = self.selectedCategory {
                do {
                    try self.realm.write {
                        let newItem = Item()
                        newItem.itemName = textFieldData.text!
                        newItem.dateCreated = Date()
                        print(newItem.dateCreated)
                        currentCategory.items.append(newItem)
                    }
                    
                }catch{
                    print("Error saving data: \(error)")
                    }
                }
            self.tableView.reloadData()
            //COREDATA newItem.parentCategory = self.selectedCategory
            //CORE DATA            self.messageArray.append(newItem)
            //            self.defaults.set(self.messageArray, forKey: "ToDoList")
        }
        alertItem.addAction(action)
        present(alertItem, animated: true, completion: nil)
    }
    
    //MARK: Retreive messages
    
    //    CORE DATA model//item fetch request has a default value which allows for calling the function without variables.
    //    func loadData(with fetchItems: NSFetchRequest<ToDoModelData> = ToDoModelData.fetchRequest(), predicate: NSPredicate? = nil){
    //        let categoryPredicate = NSPredicate(format: "parentCategory.name MATCHES %@", selectedCategory!.name!)
    //        if let additionalPredicate = predicate{
    //            fetchItems.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [categoryPredicate, additionalPredicate])
    //        } else {
    //            fetchItems.predicate = categoryPredicate
    //        }
    //
    //        do {
    //            messageArray = try contextItem.fetch(fetchItems)
    //        }catch {
    //            print("Unable to fetch items : \(error)")
    //        }
    //        tableView.reloadData()
    //    }
    
    //    func loadData() {
    //        if let data = try? Data(contentsOf: dataFilePath!){
    //            let decoder = PropertyListDecoder()
    //            do {
    //                messageArray = try decoder.decode([ToDoModelData].self, from: data)
    //            }catch{
    //                print("Error Decoding data : \(error)")
    //            }
    //
    //        }
    //    }
    
    func loadData(){
        todoItems = selectedCategory?.items.sorted(byKeyPath: "itemName", ascending: true)
        tableView.reloadData()
    }
    
    //MARK: Save data method
    // COREDATA   func saveData(){
    //        do {
    //            try contextItem.save()
    //        } catch {
    //            print("Error saving data: \(error)")
    //        }
    //        tableView.reloadData()
    //    }
    //    func saveData(items: Item){
    //        do {
    //            try realm.write {
    //                realm.add(items)
    //            }
    //
    //        }catch{
    //            print("Error writing items : \(error)")
    //        }
    //        tableView.reloadData()
    //    }
    
}

//MARK: Delegate methods
//CORE DATA extension TodoListViewController : UISearchBarDelegate{
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        let request : NSFetchRequest<ToDoModelData> = ToDoModelData.fetchRequest()
//        let predicate = NSPredicate(format: "itemName CONTAINS[cd] %@", searchBar.text!)
//        request.sortDescriptors = [NSSortDescriptor(key: "itemName", ascending: true)]
//        loadData(with: request, predicate: predicate)
//    }
//
//
//    //MARK: Cancel button
//
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        if searchBar.text?.count == 0{
//            loadData()
//
//        DispatchQueue.main.async {
//            searchBar.resignFirstResponder()
//            }
//
//        }
//    }
//}
extension TodoListViewController : UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        todoItems = todoItems?.filter("itemName CONTAINS [cd] %@", searchBar.text!).sorted(byKeyPath: "itemName", ascending:true)
        tableView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text?.count == 0{
            loadData()
            DispatchQueue.main.async {
                searchBar.resignFirstResponder()
            }
        }
    }
}

