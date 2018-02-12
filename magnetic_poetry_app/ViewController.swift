//
//  ViewController.swift
//  magnetic_poetry_app
//
//  Created by Student on 2/11/18.
//  Copyright © 2018 Paul DeSimone and Nick Federico. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let words = ["could", "cloud", "bot", "bit", "ask", "a", "geek", "flame", "file",
                 "ed", "ed", "create", "like", "lap", "is", "ing", "I", "her", "drive",
                 "get", "soft", "screen", "protect", "online", "meme", "to", "they",
                 "that", "tech", "space", "source", "y", "write", "while"]
    
    override func viewDidLoad() {
        placeWords()
        
        super.viewDidLoad()
    }
    
    func placeWords() {
        view.backgroundColor = UIColor.orange
        for word in words{
            let l = UILabel()
            l.backgroundColor = UIColor.white
            l.text = "   \(word)   "
            l.sizeToFit()
            let x = CGFloat(arc4random() % 280) + 20.0
            let y = CGFloat(arc4random() % 300) + 30.0
            l.center = CGPoint(x:x, y:y)
            view.addSubview(l)
            l.isUserInteractionEnabled = true
            let panGesture = UIPanGestureRecognizer(target: self, action: #selector(doPanGesture))
            l.addGestureRecognizer(panGesture)
        }
    }
    
    @objc func doPanGesture(panGesture:UIPanGestureRecognizer){
        let label = panGesture.view as! UILabel
        let position = panGesture.location(in: view)
        label.center = position
    }



}



