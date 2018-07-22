//
//  TravelDetailViewController.swift
//  SkylineTest
//
//  Created by apple on 2018/7/22.
//  Copyright © 2018年 Johnny. All rights reserved.
//

import UIKit

class TravelDetailViewController: UIViewController {
    lazy var viewModel: TravelViewModel = {
        return TravelViewModel()
    }()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
