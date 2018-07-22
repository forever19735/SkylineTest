//
//  TravelImageCell.swift
//  SkylineTest
//
//  Created by apple on 2018/7/21.
//  Copyright © 2018年 Johnny. All rights reserved.
//

import UIKit
import Kingfisher

class TravelImageCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
    }
    
    func setUp(urls: URL?) {
         imageView.kf.setImage(with: urls, placeholder: nil, options: nil, progressBlock: nil, completionHandler: nil)
    }

}
