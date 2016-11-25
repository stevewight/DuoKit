//
//  DuoImprovement.swift
//  Linguist
//
//  Created by Steve on 10/30/16.
//  Copyright © 2016 31Labs. All rights reserved.
//

import UIKit

public class DuoImprovement: NSObject {
    
    public var value = 0
    public var datetime = Date()

    public init?(rawJson:[String:AnyObject]) {
        super.init()
        
        if let newValue = rawJson["improvement"] as? Int {
            value = newValue
        }
        
        if let newDatetime = rawJson["datetime"] as? Int {
            let timeInterval = TimeInterval(newDatetime)/1000.0
            datetime = Date(
                timeIntervalSince1970: timeInterval
            )
        }
    }
    
}
