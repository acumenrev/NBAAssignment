//
//  TUIViewExtension.swift
//  KrowdpopApp
//
//  Created by TriVo on 8/11/16.
//  Copyright © 2016 Nguyen Khoi Nguyen. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    /**
     Fade in a view with a duration
     
     - parameter duration: custom animation duration
     */
    func animateFadeIn(duration duration: NSTimeInterval = 1.0) {
        UIView.animateWithDuration(duration, animations: {
            self.alpha = 1.0
        })
    }
    
    /**
     Fade out a view with a duration
     
     - parameter duration: custom animation duration
     */
    func animateFadeOut(duration duration: NSTimeInterval = 1.0) {
        UIView.animateWithDuration(duration, animations: {
            self.alpha = 0.0
        })
    }
    
    func animatePulse(duration duration : NSTimeInterval = 0.25, show isShow : Bool) {
        if isShow {
            self.transform = CGAffineTransformMakeScale(0.7, 0.7)
            self.alpha = 0.0;
            UIView.animateWithDuration(duration, animations: {
                self.alpha = 1.0
                self.transform = CGAffineTransformMakeScale(1.0, 1.0)
            });
        } else {
            UIView.animateWithDuration(0.25, animations: {
                self.transform = CGAffineTransformMakeScale(0.7, 0.7)
                self.alpha = 0.0;
                }, completion:{(finished : Bool)  in
                    if (finished)
                    {
                        self.removeFromSuperview()
                    }
            });
        }
    }
    
    func animateCurlUp(duration duration : NSTimeInterval = 1.0) {
        /*
         // create a 'tuple' (a pair or more of objects assigned to a single variable)
         let views = (frontView: self.redSquare, backView: self.blueSquare)
         
         // set a transition style
         let transitionOptions = UIViewAnimationOptions.TransitionCurlUp
         
         UIView.transitionWithView(self.container, duration: 1.0, options: transitionOptions, animations: {
         // remove the front object...
         views.frontView.removeFromSuperview()
         
         // ... and add the other object
         self.container.addSubview(views.backView)
         
         }, completion: { finished in
         // any code entered here will be applied
         // .once the animation has completed
         })
         */
    
    }
    
    func mask(viewToMask: UIView, maskRect: CGRect) {
        let maskLayer = CAShapeLayer()
        let path = CGPathCreateWithRect(maskRect, nil)
        maskLayer.path = path
        
        // Set the mask of the view.
        viewToMask.layer.mask = maskLayer;
    }
}