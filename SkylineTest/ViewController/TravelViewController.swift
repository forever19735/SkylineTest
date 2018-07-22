//
//  TravelViewController.swift
//  SkylineTest
//
//  Created by apple on 2018/7/20.
//  Copyright © 2018年 Johnny. All rights reserved.
//

import UIKit
protocol TravelDelegate: class {
    func send(image: [String])
}
class TravelViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    weak var delegate: TravelDelegate?
    lazy var viewModel: TravelViewModel = {
        return TravelViewModel()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(cellType: TravelTitleCell.self)
        initVM()
    }
    
    func initVM(){
       
        viewModel.updateLodingStatus = {[weak self]( ) in
            DispatchQueue.main.async {
                let isLoading = self?.viewModel.isLoading ?? false
                if isLoading {
                    Alert.shared.showLoadingHud(view: (self?.view)!)
                    UIView.animate(withDuration: 0.2, animations: {
                        self?.tableView.alpha = 0.0
                    })
                } else {
                    Alert.shared.hideLoadingHud()
                    UIView.animate(withDuration: 0.2, animations: {
                        self?.tableView.alpha = 1.0
                    })
                }
            }
        }
        
        viewModel.reloadTableViewClousure = { [weak self] () in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        viewModel.initFetch()
        
    }
    
}

extension TravelViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfCells
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellVM = viewModel.getCellViewModel(at: indexPath.row)
        self.viewModel.userPressed(at: indexPath)

        let cell = self.tableView.dequeueReusableCell(with: TravelTitleCell.self, for: indexPath)
        cell.setup(with: cellVM)
        cell.travelDetail = viewModel.selectedTravel
        
        delegate = cell
        delegate?.send(image: cellVM.image)
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
        
    }
    
}
