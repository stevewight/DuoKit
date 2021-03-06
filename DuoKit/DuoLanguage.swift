//
//  DuoLanguage.swift
//  Linguist
//
//  Created by Steve on 10/29/16.
//  Copyright © 2016 31Labs. All rights reserved.
//

import UIKit

public class DuoLanguage: NSObject {

    public var streak = 0
    public var fluencyScore = 0.0
    public var languageStrength = 0.0
    public var languageString = ""
    public var numSkillsLearned = 0
    public var improvements = [DuoImprovement]()
    public var skills = [DuoSkill]()
    public var duoLevel = DuoLevel()
    public var nextSkillTitle = ""
 
    public override init() {
        super.init()
    }
    
    public init?(rawJson:[String:AnyObject]) {
        super.init()
        
        if let newStreak = rawJson["streak"] as? Int {
            streak = newStreak
        }
        
        if let newFluencyScore = rawJson["fluency_score"] as? Double {
            fluencyScore = newFluencyScore
        }
        
        if let newLanguageStrength = rawJson["language_strength"] as? Double {
            languageStrength = newLanguageStrength
        }
        
        if let newLanguageString = rawJson["language_string"] as? String {
            languageString = newLanguageString
        }
        
        if let newNumSkillsLearned = rawJson["num_skills_learned"] as? Int {
            numSkillsLearned = newNumSkillsLearned
        }
        
        if let newImprovements = rawJson["calendar"] as? [[String:AnyObject]] {
            for improv in newImprovements {
                let newImprovement = DuoImprovement(rawJson: improv)
                improvements.append(newImprovement!)
            }
        }
        
        if let newSkills = rawJson["skills"] as? [[String:AnyObject]] {
            for skill in newSkills {
                let newSkill = DuoSkill(rawJson: skill)
                skills.append(newSkill!)
            }
        }
        
        if let newNextSkillTitle = rawJson["next_lesson"] as? [String:AnyObject] {
            if let nextTitle = newNextSkillTitle["skill_title"] as? String {
                nextSkillTitle = nextTitle
            }
        }
        
        duoLevel = DuoLevel(rawJson: rawJson)!
    }
    
}
