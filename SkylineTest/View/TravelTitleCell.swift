//
//  TravelTitleCell.swift
//  SkylineTest
//
//  Created by apple on 2018/7/21.
//  Copyright © 2018年 Johnny. All rights reserved.
//

import UIKit
import Kingfisher


class TravelTitleCell: UITableViewCell, TravelProtocol {
   
    var travelDetail: TravelInfos?

    @IBOutlet weak var titleLabl: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    fileprivate let flowLayout = UICollectionViewFlowLayout()
    
    var imageUrls: [String] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(cellType: TravelImageCell.self)
        setupFlowLayout()
        collectionView.collectionViewLayout = flowLayout
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setup(with model: TravelListViewCellModel) {
        titleLabl.text = model.title
        descriptionLabel.text = model.description
        imageUrls = model.image
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    private func setupFlowLayout() {
        flowLayout.sectionInset = .init(top: 20, left: 10, bottom: 20, right: 10)
        flowLayout.minimumLineSpacing = 10
        flowLayout.minimumInteritemSpacing = 10
        flowLayout.scrollDirection = .horizontal
        let width = CGFloat(Int(UIScreen.main.bounds.width / 2))
        flowLayout.itemSize = CGSize(width: width, height: collectionView.frame.size.height)
    }
    
}

extension TravelTitleCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return imageUrls.count - 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(with: TravelImageCell.self, for: indexPath)
        
        let urls = URL(string: imageUrls[indexPath.item])
        cell.setUp(urls: urls)
        
        return  cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detail = TravelDetailViewController()
        let topVC = UIApplication.getTopMostViewController()
        detail.travelDetail = travelDetail
        topVC?.navigationController?.pushViewController(detail, animated: true)
    }
}
