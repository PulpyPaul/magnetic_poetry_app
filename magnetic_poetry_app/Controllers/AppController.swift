//
//  AppController.swift
//  magnetic_poetry_app
//
//  Created by Student on 3/3/18.
//  Copyright © 2018 Paul DeSimone Nick Federico. All rights reserved.
//

import Foundation

class AppController {
    
    private var dataModel: AppData
    
    var wordSet: [String] {
        get {
            return dataModel.currentWordSet
        }
    }
    
    init(dataModel: AppData = AppDataUserDefaults()) {
        self.dataModel = dataModel
    }
    
    func updateWordSet(newWordSet: [String]) {
        dataModel.currentWordSet = newWordSet
        dataModel.save()
    }
}
