//
//  DarkNavigationController.swift
//  SkylineTest
//
//  Created by apple on 2018/7/21.
//  Copyright © 2018年 Johnny. All rights reserved.
//

import UIKit

class DarkNavigationController: BaseNavigationController{
    
    // MARK: Init
    
    override init(rootViewController: UIViewController) {
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
        
        navigationBar.barTintColor = UIColor.colorWithRGBValue(red: 58, green: 197, blue: 255, alpha: 1)
        navigationBar.isTranslucent = false
        navigationBar.tintColor = UIColor.white
        navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        navigationBar.topItem?.title = "台北市熱門景點"
    }
    
}
