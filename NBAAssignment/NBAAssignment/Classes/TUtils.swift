//
//  TUtils.swift
//  NBAAssignment
//
//  Created by TriVo on 9/11/16.
//  Copyright © 2016 TriVo. All rights reserved.
//

import UIKit

class TUtils: NSObject {
    
    /**
     Get AppDelegate instance
     
     - returns: AppDelegate instance
     */
    static func appDelegate() -> AppDelegate {
        return (UIApplication.sharedApplication().delegate as! AppDelegate)
    }
    
    /**
     Checks string is NULL
     
     - parameter value: String value need to be checked
     
     - returns: return true
     */
    static func checkNullString(value : String?) -> String {
        if value == nil {
            return ""
        }
        
        if TUtils.checkStringNullOrEmpty(value) == true {
            return ""
        }
        
        return value!
    }
    
    /**
     Check string NULL or EMPTY
     
     - parameter value: String balue need to be checked
     
     - returns: true if value is null or empty
     */
    static func checkStringNullOrEmpty(value : String?) -> Bool {
        if value == nil {
            return true
        }
        
        if value!.isEmpty {
            return true
        }
        
        
        let newValue = value!.stringByReplacingOccurrencesOfString(" ", withString: "")
        if newValue.isEmpty {
            return true
        }
        
        return false
    }
}
