//
//  DuoLevel.swift
//  Linguist
//
//  Created by Steve on 11/1/16.
//  Copyright © 2016 31Labs. All rights reserved.
//

import UIKit

public class DuoLevel: NSObject {

    public var progress = 0
    public var left = 0
    public var points = 0
    public var current = 0
    public var next = 0
    
    public override init() {
        super.init()
    }
    
    public init?(rawJson:[String:AnyObject]) {
        
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
    
    public func levelPercent()->Double {
        let progressDouble = Double(progress)
        let totalDouble = Double(points)
        return progressDouble/totalDouble
    }
    
}
