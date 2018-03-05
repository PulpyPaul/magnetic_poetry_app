//
//  AppController.swift
//  magnetic_poetry_app
//
//  Created by Student on 3/3/18.
//  Copyright © 2018 Paul DeSimone Nick Federico. All rights reserved.
//

import Foundation

class AppController {
    
    // ivars
    private var dataModel: AppData
    
    var wordSet: [String] {
        get {
            return dataModel.currentWordSet
        }
    }
    
    var categories: [String] {
        get {
            return dataModel.categories
        }
    }
    
    // initializer
    init(dataModel: AppData = AppDataUserDefaults()) {
        self.dataModel = dataModel
    }
    
    // functions
    func updateWordSet(newWordSet: [String]) {
        dataModel.currentWordSet = newWordSet
        dataModel.save()
    }
    
    func getWordset(category:String)->[String] {
        return Constants.AppData.wordSets[category] ?? [String]()
    }
}
