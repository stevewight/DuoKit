//
//  DuoSkill.swift
//  Linguist
//
//  Created by Steve on 10/30/16.
//  Copyright © 2016 31Labs. All rights reserved.
//

import UIKit

class DuoSkill: NSObject {

    var languageString = ""
    var iconColor = ""
    var title = ""
    var learned = false
    var index = 0
    var isBonus = false
    var short = ""
    var progressPercent = 0
    var isMastered = false
    
    init?(rawJson:[String:AnyObject]) {
        super.init()
        
        if let newLanguageSkill = rawJson["language_string"] as? String {
            languageString = newLanguageSkill
        }
        
        if let newIconColor = rawJson["icon_color"] as? String {
            iconColor = newIconColor
        }
        
        if let newTitle = rawJson["title"] as? String {
            title = newTitle
        }
        
        if let newLearned = rawJson["learned"] as? Bool {
            learned = newLearned
        }
        
        if let newIndex = rawJson["index"] as? String {
            index = Int(newIndex)!
        }
        
        if let newBonus = rawJson["bonus"] as? Bool {
            isBonus = newBonus
        }
        
        if let newShort = rawJson["short"] as? String {
            short = newShort
        }
        
        if let newProgressPercent = rawJson["progress_percent"] as? Int {
            progressPercent = newProgressPercent
        }
        
        if let newIsMastered = rawJson["mastered"] as? Bool {
            isMastered = newIsMastered
        }
        
    }
    
}
