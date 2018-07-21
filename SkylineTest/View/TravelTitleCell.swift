//
//  TravelTitleCell.swift
//  SkylineTest
//
//  Created by apple on 2018/7/21.
//  Copyright © 2018年 Johnny. All rights reserved.
//

import UIKit

class TravelTitleCell: UITableViewCell {

    @IBOutlet weak var titleLabl: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    fileprivate let flowLayout = UICollectionViewFlowLayout()

    var str: [String] = []
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(cellType: TravelImageCell.self)
        collectionView.collectionViewLayout = flowLayout
        setupFlowLayout()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(with model: TravelListViewCellModel) {
        titleLabl.text = model.title
        descriptionLabel.text = model.description
        let lowerStr = model.image.lowercased()
        let value = lowerStr.components(separatedBy: "jpg")
        for i in value {
//            print()
            str.append(i + "jpg")
        }
    }
    
    private func setupFlowLayout() {
        flowLayout.sectionInset = .init(top: 10, left: 10, bottom: 20, right: 10)
        flowLayout.minimumLineSpacing = 10
        flowLayout.minimumInteritemSpacing = 10
        flowLayout.scrollDirection = .horizontal
        let width = CGFloat(Int((UIScreen.main.bounds.width - 40) / 3))
        flowLayout.itemSize = CGSize(width: width, height: collectionView.frame.size.height)
    }
    
}
extension TravelTitleCell: UICollectionViewDelegate, UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return str.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(with: TravelImageCell.self, for: indexPath)
        for i in str {
             cell.imageView.downloadedFrom(link: i)
        }
       

        
        return  cell
    }
}
