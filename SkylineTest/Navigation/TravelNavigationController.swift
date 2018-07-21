//
//  TravelNavigationController.swift
//  SkylineTest
//
//  Created by apple on 2018/7/20.
//  Copyright © 2018年 Johnny. All rights reserved.
//

import UIKit

class TravelNavigationController:  DarkNavigationController {
    
    // MARK: Init
    
    init() {
        super.init(rootViewController: TravelViewController())
    }
    
    private override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        
        setUp()
        
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        setUp()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setUp()
        
    }
    
    // MARK: Set Up
    private func setUp() {
    }
}
