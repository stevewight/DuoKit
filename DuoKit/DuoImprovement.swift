//
//  DuoImprovement.swift
//  Linguist
//
//  Created by Steve on 10/30/16.
//  Copyright © 2016 31Labs. All rights reserved.
//

import UIKit

class DuoImprovement: NSObject {
    
    var value = 0
    var datetime = Date()

    init?(rawJson:[String:AnyObject]) {
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
