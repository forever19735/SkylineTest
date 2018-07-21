//
//  TravelModel.swift
//  SkylineTest
//
//  Created by apple on 2018/7/20.
//  Copyright © 2018年 Johnny. All rights reserved.
//

import Foundation

struct TravelListViewCellModel {
    let title: String
    let description: String
    let image: String
}



class TravelViewModel{
    
    private var cellViewModels: [TravelListViewCellModel] = [TravelListViewCellModel](){
        didSet{
            self.reloadTableViewClousure?()
        }
    }
    
    private var travelInfo: [TravelInfos] = [TravelInfos]()
    
    var numberOfCells: Int{
        return cellViewModels.count
    }
    
    var isLoading: Bool = false {
        didSet {
            self.updateLodingStatus?()
        }
    }
    
    var alertMessage: String? {
        didSet {
            self.showAlertCloure?()
        }
    }
    
    var selectedStation: TravelInfos?
    
    var reloadTableViewClousure: (()->())?
    var updateLodingStatus: (()->())?
    var showAlertCloure: (()->())?
    
    func initFetch() {
      
        self.isLoading = true
        _ = DataManager.shared.requestTravel({ (data) in
            self.isLoading = false
            self.processFetchedTravel(travels: data.result.results)
        }) { (error) in
            self.alertMessage = error.localizedDescription
            print(error.localizedDescription)
        }
    }
    
    func getCellViewModel(at indexPath: Int) -> TravelListViewCellModel {
        return cellViewModels[indexPath]
    }
    
    func createCellViewModel(travel: TravelInfos) -> TravelListViewCellModel {
        return TravelListViewCellModel(title: travel.stitle, description: travel.xbody, image: travel.file)
    }
    
    private func processFetchedTravel(travels: [TravelInfos]){
        self.travelInfo = travels
        var valueArray = [TravelListViewCellModel]()
        for travel in travels {
            valueArray.append(createCellViewModel(travel: travel))
        }
        self.cellViewModels = valueArray
    }
    
}
