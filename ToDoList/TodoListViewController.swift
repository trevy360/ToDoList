//
//  ViewController.swift
//  ToDoList
//
//  Created by Morris Wilson on 3/10/18.
//  Copyright © 2018 Morris Wilson. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var itemArray = ["Cell 1", "Cell 2", "Cell 3"]


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)

        cell.textLabel?.text = itemArray[indexPath.row]

        return cell
        

    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        //print(itemArray[indexPath.row])



        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark

        }

        tableView.deselectRow(at: indexPath, animated: true)


    }



    @IBAction func addButtobPushed(_ sender: UIBarButtonItem) {

        var textField = UITextField()



        let alert = UIAlertController(title: "Add new Publix List Item", message: "", preferredStyle: .alert)


        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //What will happen once the user clicks the add item button on our UIAlert

            self.itemArray.append(textField.text!)

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
































































