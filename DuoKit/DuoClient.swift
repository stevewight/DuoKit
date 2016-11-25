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

class DuoClient: NSObject {
    
    static let sharedInstance = {
        return DuoClient()
    }()

    let baseURL = "https://api.duolingo.com/"
    var currentUser = ""
    var duoUser = DuoUser()
    
    func loadDuoUser(success:@escaping (_ newUser:DuoUser)->Void, failure:@escaping ()->Void) {
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
