//
//  Protocols.swift
//  SkylineTest
//
//  Created by apple on 2018/7/21.
//  Copyright © 2018年 Johnny. All rights reserved.
//

import UIKit

class LoadingView {
    static let shared = LoadingView()
    private var hud = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
    
    @discardableResult
    func show(view: UIView = UIApplication.shared.keyWindow!) -> UIActivityIndicatorView{
        hud.center = CGPoint(x: view.frame.size.width / 2, y: view.frame.size.height / 2)
        view.addSubview(hud)
        hud.startAnimating()
        return hud
    }
    
    func hide(view: UIView = UIApplication.shared.keyWindow!, animated: Bool = true) {
       hud.stopAnimating()
    }
}
