//
//  TableViewController.swift
//  magnetic_poetry_app
//
//  Created by Student on 2/17/18.
//  Copyright © 2018 Paul DeSimone Nick Federico. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    // ivars
    var appController : AppController!
    var selectedWordSet = Constants.AppData.wordSets["Basic"]
    
    // functions
    override func viewDidLoad() {
       super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appController.categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "wordSet", for: indexPath)
        let category = appController.categories[indexPath.row]
        cell.textLabel?.text = category
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let category = appController.categories[indexPath.row]
        selectedWordSet = appController.getWordset(category: category)
    }
}


