//
//  TCollectionViewExtension.swift
//  KrowdpopApp
//
//  Created by Tri Vo on 7/21/16.
//  Copyright © 2016 Nguyen Khoi Nguyen. All rights reserved.
//

import Foundation
import UIKit


extension UICollectionView {
    /**
     Register cell nib
     
     - parameter cellClass: Cell class
     */
    func registerCellNib(cellClass: AnyClass) {
        let identifier = String.className(cellClass)
        let nib = UINib(nibName: identifier, bundle: nil)
        self.registerNib(nib, forCellWithReuseIdentifier: identifier)
    }
    
    /**
     Register cell nib with alternative identifier
     
     - parameter cellClass:             Cell class
     - parameter alternativeIdentifier: Alternative identifier
     */
    func registerCellNib(cellClass : AnyClass, alternativeIdentifier : String) {
        let identifier = String.className(cellClass)
        let nib = UINib(nibName: identifier, bundle: nil)
        self.registerNib(nib, forCellWithReuseIdentifier: alternativeIdentifier)
    }
}