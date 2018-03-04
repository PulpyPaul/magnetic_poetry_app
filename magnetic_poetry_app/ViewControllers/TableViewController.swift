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
    var appController : AppController!
    var selectedWordSet = Constants.AppData.wordSets["Basic"]
    
    override func viewDidLoad() {
       assert(appController != nil, "Dependency inject model")
       super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let category = appController.categories[section]
        let results = appController.getWordset(category: category)
        return results.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "wordSet", for: indexPath)
        let category = appController.categories[indexPath.section]
        let results = appController.getWordset(category: category)
        let item = results[indexPath.row]
        cell.textLabel?.text = item
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let category = appController.categories[indexPath.section]
        selectedWordSet = appController.getWordset(category: category)
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


