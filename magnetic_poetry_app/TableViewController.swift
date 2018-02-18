//
//  TableViewController.swift
//  magnetic_poetry_app
//
//  Created by Student on 2/17/18.
//  Copyright © 2018 Paul DeSimone Nick Federico. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var wordSets = ["Colors", "Clothing", "Food"]
    
    override func viewDidLoad() {
       super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return wordSets.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Creates a cell for each of the wordsets
        let cell = tableView.dequeueReusableCell(withIdentifier: "wordSet", for: indexPath)
        cell.textLabel?.text = wordSets[indexPath.row]
        return cell
    }

}


