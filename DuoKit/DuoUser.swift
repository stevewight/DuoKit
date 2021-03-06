//
//  DuoUser.swift
//  Linguist
//
//  Created by Steve on 10/29/16.
//  Copyright © 2016 31Labs. All rights reserved.
//

import UIKit

public class DuoUser: NSObject {
    
    public var username = ""
    public var created = ""
    public var streakExtendedToday = false
    public var learningLanguage = ""
    public var duoLanguages = [String:DuoLanguage]()
    public var lingots = 0
    public var dailyGoal = 0
    
    public override init() {
        super.init()
    }

    public init?(rawJson:[String:AnyObject]) {
        super.init()
        
        if let newUserName = rawJson["username"] as? String {
            username = newUserName
        }
        
        if let newCreated = rawJson["created"] as? String {
            created = newCreated.replacingOccurrences(
                of: "\n",
                with: ""
            )
        }
        
        if let newStreakExtendedToday = rawJson["streak_extended_today"] as? Bool {
            streakExtendedToday = newStreakExtendedToday
        }
        
        if let newLearningLanguage = rawJson["learning_language"] as? String {
            learningLanguage = newLearningLanguage
        }
        
        if let newDuoLanguage = rawJson["language_data"] as? [String:AnyObject] {
            createDuoLanguages(rawJson: newDuoLanguage)
        }
        
        if let newLingots = rawJson["rupees"] as? Int {
            lingots = newLingots
        }
        
        if let newDailyGoal = rawJson["daily_goal"] as? Int {
            dailyGoal = newDailyGoal
        }
    }
    
    public func duoLanguage()->DuoLanguage {
        if duoLanguages.count > 0 {
            return duoLanguages[learningLanguage]!
        } else {
            return DuoLanguage()
        }
    }
    
    func createDuoLanguages(rawJson:[String:AnyObject]) {
        for (k,v) in rawJson {
            let newDuoLanguage = DuoLanguage(rawJson: v as! [String : AnyObject])
            self.duoLanguages[k] = newDuoLanguage!
        }
    }
    
}
