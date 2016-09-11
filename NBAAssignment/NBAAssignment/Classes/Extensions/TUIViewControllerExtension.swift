//
//  TUIViewControllerExtension.swift
//  dotabuff
//
//  Created by Tri Vo on 6/24/16.
//  Copyright © 2016 acumen. All rights reserved.
//

import Foundation
import UIKit


extension UIViewController {
    

    func setViewControllerTitle(title : String) {
        self.title = title
    }
    


    func showAlert(title : String, message : String, delegate : AnyObject?, tag : Int, cancelButton: String, ok : String, okHandler:() -> (), cancelhandler:() -> ()) -> UIAlertController {
        let alertContronoller = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        
        if cancelButton.length > 0 {
            let alertAction = UIAlertAction(title: cancelButton, style: .Cancel, handler: { (action) in
                cancelhandler()
            })
            
            alertContronoller.addAction(alertAction)
        }
        
        if ok.length > 0 {
            let alertAction = UIAlertAction(title: ok, style: .Default, handler: { (action) in
                okHandler()
            })
            
            alertContronoller.addAction(alertAction)
        }
    
        return alertContronoller
    }
    
    /**
     Show error alert
     
     - parameter errorMsg:      Error Msg
     - parameter delegate:      Delegate
     - parameter tag:           Tag
     - parameter cancelTitle:   Cancel title
     - parameter okTitle:       Ok Title
     - parameter cancelHandler: Cancel handler
     - parameter okHandler:     Ok handler
     */
    func showErrorAlert(message errorMsg : String, delegate : AnyObject?, tag : Int, cancelTitle : String, okTitle : String = "",
                                cancelHandler : () -> (),
                                okHandler : () -> ()) {
        let alert = showAlert("Error", message: errorMsg, delegate: delegate, tag: tag, cancelButton: cancelTitle, ok: okTitle, okHandler: { 
                okHandler()
            }) { 
                cancelHandler()
        }
        
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    /**
     Set back button with title
     
     - parameter title: Title
     */
    func setBackButtonWithTitle(title : String) {
        
        let btnBack = UIBarButtonItem(title: "", style: .Plain, target: nil, action: nil)
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = btnBack
    }
    
    
    
 
    var currentTopViewController:UIViewController?{
        let base = UIApplication.sharedApplication().keyWindow?.rootViewController
        
            if let nav = base as? UINavigationController {
                return nav.visibleViewController
            }
            if let tab = base as? UITabBarController {
                if let selected = tab.selectedViewController {
                    return selected
                }
            }
            if let presented = base?.presentedViewController {
                return presented
            }
            return base
    }
}