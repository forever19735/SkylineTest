//
//  TravelImageTableViewCell.swift
//  SkylineTest
//
//  Created by apple on 2018/7/21.
//  Copyright © 2018年 Johnny. All rights reserved.
//

import UIKit

class TravelImageTableViewCell: UITableViewCell {
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(cellType: TravelImageCell.self)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension TravelImageTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 10
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(with: TravelImageCell.self, for: indexPath)
        //        cell.imageView.image
        
        return  cell
    }
}

extension TravelImageTableViewCell: TravelDelegate {
    func send(image: String) {
        print(image)
    }
    
    
}
