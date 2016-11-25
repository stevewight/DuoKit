//
//  DuoLevel.swift
//  Linguist
//
//  Created by Steve on 11/1/16.
//  Copyright © 2016 31Labs. All rights reserved.
//

import UIKit

class DuoLevel: NSObject {

    var progress = 0
    var left = 0
    var points = 0
    var current = 0
    var next = 0
    
    override init() {
        super.init()
    }
    
    init?(rawJson:[String:AnyObject]) {
        
        if let newProgress = rawJson["level_progress"] as? Int {
            progress = newProgress
        }
        
        if let newLeft = rawJson["level_left"] as? Int {
            left = newLeft
        }
        
        if let newPoints = rawJson["level_points"] as? Int {
            points = newPoints
        }
        
        if let newCurrent = rawJson["level"] as? Int {
            current = newCurrent
        }
        
        if let newNext = rawJson["next_level"] as? Int {
            next = newNext
        }
    }
    
    func levelPercent()->Double {
        let progressDouble = Double(progress)
        let totalDouble = Double(points)
        return progressDouble/totalDouble
    }
    
}
