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

    let defaults = UserDefaults.standard



    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

           let newItem = Item()
           newItem.title = "Cell 1"
           itemArray.append(newItem)

           let newItem2 = Item()
           newItem2.title = "Cell 2"
           itemArray.append(newItem2)

           let newItem3 = Item()
           newItem3.title = "Cell 3"
           itemArray.append(newItem3)





            if let items = defaults.array(forKey: "ToDoListArray") as?
                [Item] {
            itemArray = items
        }

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


        tableView.reloadData()

        tableView.deselectRow(at: indexPath, animated: true)


    }



    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {

        var textField = UITextField()



        let alert = UIAlertController(title: "Add new Publix List Item", message: "", preferredStyle: .alert)


        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //What will happen once the user clicks the add item button on our UIAlert


            let newItem = Item()
            newItem.title = textField.text!

            self.itemArray.append(newItem)

            self.defaults.set(self.itemArray, forKey: "ToDoListArray")

            self.tableView.reloadData()


        }

        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Add New Item"
            textField = alertTextField



        }




        alert.addAction(action)

        present(alert, animated: true, completion: nil)



        }





    }
































































