//
//  TableViewController.swift
//  magnetic_poetry_app
//
//  Created by Student on 2/17/18.
//  Copyright © 2018 Paul DeSimone Nick Federico. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var backgroundImage:UIImage?

    // Word sets
    let wordSet_Food = ["pineapple", "pasta", "sausage", "cereal", "apple", "orange", "banana", "steak", "chicken", "pizza", "wings", "beef", "pork"]
    let wordSet_Clothing = ["shoes", "hat", "sweatshirt", "socks", "pants", "shirt", "jacket", "gloves", "underwear"]
    let wordSet_Majors = ["Game Development", "Computer Science", "Biology", "Chemistry", "Engineering", "Physics", "Graphic Design", "Performing Arts"]
    
    // Empty Tuple
    var wordSets: [(name: String, value: [String])] = []
    
    var selectedWordSet = ["Why can't you just select a value..."]
    
    override func viewDidLoad() {
        wordSets.append((name: "Food", value: wordSet_Food))
        wordSets.append((name: "Clothing", value: wordSet_Clothing))
        wordSets.append((name: "Majors", value: wordSet_Majors))
       super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return wordSets.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Creates a cell for each of the wordsets
        let cell = tableView.dequeueReusableCell(withIdentifier: "wordSet", for: indexPath)
        
        // Gets the tuple at a given index
        let tuple = wordSets[indexPath.row]
        
        // Updates cell name
        let tupleName = tuple.name
        cell.textLabel?.text = tupleName
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedWordSet = wordSets[indexPath.row].value
    }

    @IBAction func cameraButtonTapped(_ sender: AnyObject) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        self.present(imagePickerController, animated: true, completion: nil)
    }
    
    // Delegate methods
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        print("finshed picking")
        let image: UIImage = info[UIImagePickerControllerEditedImage] as! UIImage
        backgroundImage = image
        (self.view as! UIImageView).contentMode = .center
        (self.view as! UIImageView).image = backgroundImage
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("cancelled")
        picker.dismiss(animated: true, completion: nil)
    }
}


