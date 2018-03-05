//
//  ViewController.swift
//  magnetic_poetry_app
//
//  Created by Student on 2/11/18.
//  Copyright © 2018 Paul DeSimone and Nick Federico. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let yPadding = CGFloat(40)
    let xPadding = CGFloat(20)
    
    var backgroundImage:UIImage?
    var appController: AppController!
    var screenWidth : CGFloat = 0.0
    var screenHeight : CGFloat = 0.0
    
    // Places new words when user clicks "Done"
    @IBAction func unwindToMain(segue:UIStoryboardSegue){
        if segue.identifier == "DoneTapped" {
            let tableVC = segue.source as! TableViewController
            let currentWordSet = tableVC.selectedWordSet
            appController.updateWordSet(newWordSet: currentWordSet!)
            removeLabels()
            placeWords(newWordSet: currentWordSet!)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupScreen()
        placeWords(newWordSet: appController.wordSet)
    }
    
    // Initalizes needed values for screen calculations
    func setupScreen() {
        screenWidth = view.frame.width
        screenHeight = view.frame.height
    }
    
    // Places word on the screen based on array of strings
    func placeWords(newWordSet: [String]) {
        view.backgroundColor = UIColor(red: 255.0 / 255.0, green: 105.0 / 255.0, blue: 180.0 / 255.0, alpha: 1.0)
        
        // Used to hold current screen position values
        var currentX = CGFloat(0)
        var currentY = CGFloat(40)
        var lastWidth = CGFloat(0)
        
        for word in newWordSet{
            
            // Create a new label
            let label = UILabel()
            label.backgroundColor = UIColor.white
            
            // Add padding and resize
            label.text = "   \(word)   "
            label.sizeToFit()
            
            // Adds gets the new x value based on sizes of the current label and past label
            currentX += (lastWidth / 2) + (label.frame.size.width / 2) + xPadding
            
            // Checks if we need a new row
            if (currentX + label.frame.size.width / 2 + xPadding > screenWidth){
                currentX = CGFloat(0)
                currentX += label.frame.size.width / 2 + xPadding
                currentY += yPadding
            }
            
            // Assigns position
            label.center = CGPoint(x: currentX, y: currentY)
            
            // Assigns previous label width
            lastWidth = label.frame.size.width
            
            // Adds to view with pan gesture
            view.addSubview(label)
            label.isUserInteractionEnabled = true
            let panGesture = UIPanGestureRecognizer(target: self, action: #selector(doPanGesture))
            label.addGestureRecognizer(panGesture)
            
            // Adds a double tap gesture to delete the label
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(doubleTapped))
            tapGesture.numberOfTapsRequired = 2
            label.addGestureRecognizer(tapGesture)
        }
    }
    
    // Removes all labels from the view class' subviews
    func removeLabels() {
        for currentView in view.subviews {
            if currentView is UILabel {
                currentView.removeFromSuperview()
            }
        }
    }
    
    @objc func doPanGesture(panGesture:UIPanGestureRecognizer) {
        let label = panGesture.view as! UILabel
        let position = panGesture.location(in: view)
        label.center = position
    }
    
    // Hides status bar
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Gives the Table View Controller a reference to the app controller singleton
        let tableVC = segue.destination.childViewControllers[0] as! TableViewController
        tableVC.appController = appController
        
        if segue.identifier == "showWordSegue" {
            let tablesVC = segue.destination.childViewControllers[0] as! TableViewController
            tablesVC.title = "Customize"
        }
    }
    
    @IBAction func share(_ sender: AnyObject) {
        let image = self.view.takeSnapshot()
        let textToShare = "Check out what I made with Luxurious Literature!"
        let objectsToShare:[AnyObject] = [textToShare as AnyObject, image!]
        let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
        activityVC.excludedActivityTypes = [UIActivityType.print]
        // 3 lines for ipad
        //let popoverMenuViewController = activityVC.popoverPresentationController
        //popoverMenuViewController?.permittedArrowDirections = .any
        //popoverMenuViewController?.barButtonItem = sender as? UIBarButtonItem
        self.present(activityVC, animated: true, completion: nil)
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
    
    // Shrinks the label and removes it from subview
    @objc func doubleTapped(tapGesture: UITapGestureRecognizer) {
        for label in self.view.subviews {
            if label is UILabel {
                if (label.frame.contains(tapGesture.location(in: self.view))) {
                    UIView.animate(withDuration: 0.3, animations: { label.transform = CGAffineTransform(scaleX: 0.1, y: 0.1) }, completion: {(done: Bool) in label.removeFromSuperview()})
                }
            }
        }
    }
}
