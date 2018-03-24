//
//  ViewController.swift
//  ToDoList
//
//  Created by Morris Wilson on 3/10/18.
//  Copyright © 2018 Morris Wilson. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var itemArray = [Item]()
           let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")


    //let defaults = UserDefaults.standard (not sure if I need to keep this line of code



    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        //print(dataFilePath)

           loadItems()

    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)

        cell.textLabel?.text = itemArray[indexPath.row].title


        // cell.accessoryType = item.done ? .checkmark : .none (this line of code could replace the following if/else statement, but I didn't use it because the if/else statement is more explicit, and I'm still learning, this special line of code is called a Ternary Operator)

        if itemArray[indexPath.row].done == true {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }

        return cell
        

    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        //print(itemArray[indexPath.row])

        itemArray[indexPath.row].done = !itemArray[indexPath.row].done

        saveItems()
     

        tableView.deselectRow(at: indexPath, animated: true)


    }



    @IBAction func addButtobPushed(_ sender: UIBarButtonItem) {
    

        var textField = UITextField()



        let alert = UIAlertController(title: "Add new Publix List Item", message: "", preferredStyle: .alert)


        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //What will happen once the user clicks the add item button on our UIAlert


            let newItem = Item()
            newItem.title = textField.text!

            self.itemArray.append(newItem)

            self.saveItems()


        }

        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Add New Item"
            textField = alertTextField



        }




        alert.addAction(action)

        present(alert, animated: true, completion: nil)



        }

    func saveItems() {

        let encoder = PropertyListEncoder()


        do {
            let data = try encoder.encode(itemArray)

            try data.write(to: dataFilePath!)
        } catch {
            print("Error iencoding item array,\(error)")
        }
        self.tableView.reloadData()

    }

    func loadItems() {
        if let data = try? Data(contentsOf: dataFilePath!) {
            let decoder = PropertyListDecoder()
            do {
            itemArray = try decoder.decode([Item].self, from: data)
            } catch {
                print("Error decoding item array, \(error)")


            }

        }
    }






    }
































































