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
    var categories: [String] { get set }
        
    func save()
    func load()
}

let kWordSetKey = "kWordSetKey"

struct Constants {
    struct AppData {
   
        static let wordSets = [
            "Food" : ["pineapple", "pasta", "sausage", "cereal", "apple", "orange", "banana", "steak", "chicken", "pizza", "wings", "beef", "pork", "his", "her", "he", "she", "and", "is", "the", "in", "I", "to", "they", "cook", "bake", "clean", "cut", "boil"],
            "Clothing" : ["shoes", "hat", "sweatshirt", "socks", "pants", "shirt", "jacket", "gloves", "underwear", "He", "She", "and", "is", "the", "in", "I", "to", "they", "wearing", "put", "on", "tied", "ripped", "his", "her"],
            "Majors" : ["Game Development", "Computer Science", "Biology", "Chemistry", "Engineering", "Physics", "Graphic Design", "Performing Arts", "He", "She", "and", "is", "the", "in", "I", "to", "they", "his", "her"],
            "Basic" : ["could", "cloud", "bot", "bit", "ask", "a", "geek", "flame", "file",
                       "ed", "ed", "create", "like", "lap", "is", "ing", "I", "her", "drive",
                       "get", "soft", "screen", "protect", "online", "meme", "to", "they",
                       "that", "tech", "space", "source", "y", "write", "while", "his", "her"]
        ]
    }
}

class AppDataUserDefaults: AppData {
    
    let defaults: UserDefaults
    
    var currentWordSet: [String]
    
    var categories: [String]
    
    init(userDefaults: UserDefaults = UserDefaults.standard) {
        defaults = userDefaults
        currentWordSet = Constants.AppData.wordSets["Basic"]!
        categories = [String](Constants.AppData.wordSets.keys)
        load()
    }
    
    func save() {
        defaults.set(currentWordSet, forKey: kWordSetKey)
    }
    
    func load() {
        if let wordSet = defaults.value(forKey: kWordSetKey) as? [String] {
            self.currentWordSet = wordSet
        } else {
            self.currentWordSet = [String]()
        }
    }
}
