//
//  AppData.swift
//  magnetic_poetry_app
//
//  Created by Student on 3/3/18.
//  Copyright © 2018 Paul DeSimone Nick Federico. All rights reserved.
//

import Foundation

protocol AppData {
   
    var currentWordSet: [String] { get set }
    
    func save()
    func load()
}

let kWordSetKey = "kWordSetKey"

struct Constants {
    struct AppData {
        static let wordSet_Food = ["pineapple", "pasta", "sausage", "cereal", "apple", "orange", "banana", "steak", "chicken", "pizza", "wings", "beef", "pork"]
        
        static let wordSet_Clothing = ["shoes", "hat", "sweatshirt", "socks", "pants", "shirt", "jacket", "gloves", "underwear"]
        
        static let wordSet_Majors = ["Game Development", "Computer Science", "Biology", "Chemistry", "Engineering", "Physics", "Graphic Design", "Performing Arts"]
        
        static let wordSet_Basic = ["could", "cloud", "bot", "bit", "ask", "a", "geek", "flame", "file",
                     "ed", "ed", "create", "like", "lap", "is", "ing", "I", "her", "drive",
                     "get", "soft", "screen", "protect", "online", "meme", "to", "they",
                     "that", "tech", "space", "source", "y", "write", "while"]
    }
}

class AppDataUserDefaults: AppData {
    
    let defaults: UserDefaults
    
    var currentWordSet: [String]
    
    init(userDefaults: UserDefaults = UserDefaults.standard) {
        defaults = userDefaults
        currentWordSet = Constants.AppData.wordSet_Basic
        load()
    }
    
    func save() {
        defaults.set(currentWordSet, forKey: kWordSetKey)
        print(defaults.value(forKey: kWordSetKey))
    }
    
    func load() {
        if let wordSet = defaults.value(forKey: kWordSetKey) as? [String] {
            self.currentWordSet = wordSet
        } else {
            self.currentWordSet = [String]()
        }
    }
}
