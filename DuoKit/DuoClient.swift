//
//  DuoClient.swift
//  Linguist
//
//  Created by Steve on 10/29/16.
//  Copyright © 2016 31Labs. All rights reserved.
//

import UIKit
import Alamofire

protocol DuoClientDelegate {
    func successLoadingUser()
}

public class DuoClient: NSObject {
    
    public static let sharedInstance = {
        return DuoClient()
    }()

    public let baseURL = "https://api.duolingo.com/"
    public var currentUser = ""
    public var duoUser = DuoUser()
    
    public func loadDuoUser(success:@escaping (_ newUser:DuoUser)->Void, failure:@escaping ()->Void) {
        let userURL = baseURL + "users/\(currentUser)"
       
        Alamofire.request(userURL).responseJSON { (response) in
            switch response.result {
            case .success(_):
                if let json = response.result.value as? [String:AnyObject] {
                    self.duoUser = DuoUser(rawJson: json)!
                    success(self.duoUser)
                }
                break
            case .failure(_):
                failure()
                break
            }
        }
    }
    
}
