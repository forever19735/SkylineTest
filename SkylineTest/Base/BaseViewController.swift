//
//  BaseViewController.swift
//  SkylineTest
//
//  Created by apple on 2018/7/22.
//  Copyright © 2018年 Johnny. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    @IBOutlet weak var emptyView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
//extension BaseViewController: ViewModelLoadingStatusDelegate{
//    func showEmptyView(with error: Error?) {
//        if error != nil {
//            emptyView.alpha = 0
//            self.view.bringSubview(toFront: emptyView)
//            UIView.animate(withDuration: 0.2) {
//                self.emptyView.alpha = 1
//            }
//        }else{
//            
//        }
//    }
//    
//    func removeEmptyView() {
//        if emptyView != nil {
//            UIView.animate(withDuration: 0.2, animations: {
//                self.emptyView?.alpha = 0
//                self.emptyView?.removeFromSuperview()
//            })
//        }
//    }
//    
//    func showLoading(_ bool: Bool) {
//        
//    }
//    
//    
//}
