//
//  ViewController.swift
//  magnetic_poetry_app
//
//  Created by Student on 2/11/18.
//  Copyright © 2018 Paul DeSimone and Nick Federico. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Array of words for the app
    let words = ["could", "cloud", "bot", "bit", "ask", "a", "geek", "flame", "file",
                 "ed", "ed", "create", "like", "lap", "is", "ing", "I", "her", "drive",
                 "get", "soft", "screen", "protect", "online", "meme", "to", "they",
                 "that", "tech", "space", "source", "y", "write", "while"]
    
    // Needed values for placing words
    var screenWidth: CGFloat!
    var screenHeight: CGFloat!
    var yPadding: CGFloat!
    var xPadding: CGFloat!
    
    
    override func viewDidLoad() {
        getScreen()
        placeWords()
        super.viewDidLoad()
    }
    
    // Initalizes needed values for screen calculations
    func getScreen() {
        screenWidth = view.frame.width
        screenHeight = view.frame.height
        yPadding = CGFloat(40)
        xPadding = CGFloat(20)
    }
    
    // Places word on the screen
    func placeWords() {
        view.backgroundColor = UIColor.orange
        
        // Used to hold current screen position values
        var currentX = CGFloat(0)
        var currentY = CGFloat(40)
        var lastWidth = CGFloat(0)
        
        for word in words{
            
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
            
        }
    }
    
    @objc func doPanGesture(panGesture:UIPanGestureRecognizer) {
        let label = panGesture.view as! UILabel
        let position = panGesture.location(in: view)
        label.center = position
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "showWordSegue") {
            let tablesVC = segue.destination.childViewControllers[0] as! TableViewController
            tablesVC.title = "Choose a Word Set"
        }
    }
    
    
}
