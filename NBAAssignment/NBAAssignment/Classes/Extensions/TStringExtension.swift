//
//  TStringExtension.swift
//  dotabuff
//
//  Created by Tri Vo on 6/24/16.
//  Copyright © 2016 acumen. All rights reserved.
//

import Foundation

extension String {
    /**
     Get name of a class
     
     - parameter aClass: Class
     
     - returns: Class name
     */
    static func className(aClass: AnyClass) -> String {
        return NSStringFromClass(aClass).componentsSeparatedByString(".").last!
    }
    
    /**
     Substring from specific index
     
     - parameter from: Index
     
     - returns: Substring value
     */
    func substring(from: Int) -> String {
        return self.substringFromIndex(self.startIndex.advancedBy(from))
    }
    
        /// Length of String
    var length: Int {
        return self.characters.count
    }
    
    /**
     Encoding URL with special characters
     
     - returns: Encoded URL
     */
    func urlEncode() -> String {
        let chars = NSCharacterSet.URLQueryAllowedCharacterSet().mutableCopy() as! NSMutableCharacterSet
//        chars.removeCharactersInString("&")
        
        return self.stringByAddingPercentEncodingWithAllowedCharacters(chars)!
    }
    
    /**
     Compare Insensitive
     
     - parameter value: String need to be compared
     
     - returns: Bool value
     */
    func compareInsensitive(value : String) -> Bool {
        if self.lowercaseString.compare(value) == .OrderedSame {
            return true
        }
        return false
    }
    
    
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: NSBundle.mainBundle(), value: "", comment: "")
    }
    
    func dateForFormat(timeFormat : String) -> NSDate {
        if TUtils.checkStringNullOrEmpty(self) == false {
            // 0000-00-00 00:00:00
            if self.compareInsensitive("0000-00-00 00:00:00") == true {
                return NSDate()
            }
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat =  timeFormat
            dateFormatter.timeZone = NSTimeZone(abbreviation: "UTC")
            let date =  dateFormatter.dateFromString(self)
            return date!
        }
        return NSDate()
    }
    
    func dateForSQLFormat() -> NSDate {
        return self.dateForFormat("yyyy-MM-dd HH:mm:ss")
    }
    
    var lastPathComponent: String {
        
        get {
            return (self as NSString).lastPathComponent
        }
    }
    var pathExtension: String {
        
        get {
            
            return (self as NSString).pathExtension
        }
    }
    var stringByDeletingLastPathComponent: String {
        
        get {
            
            return (self as NSString).stringByDeletingLastPathComponent
        }
    }
    var stringByDeletingPathExtension: String {
        
        get {
            
            return (self as NSString).stringByDeletingPathExtension
        }
    }
    var pathComponents: [String] {
        
        get {
            
            return (self as NSString).pathComponents
        }
    }
    
    func stringByAppendingPathComponent(path: String) -> String {
        
        let nsSt = self as NSString
        
        return nsSt.stringByAppendingPathComponent(path)
    }
    
    func stringByAppendingPathExtension(ext: String) -> String? {
        
        let nsSt = self as NSString  
        
        return nsSt.stringByAppendingPathExtension(ext)  
    }
}