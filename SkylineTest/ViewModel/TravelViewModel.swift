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
    let image: [String]
}

protocol ViewPressedDelegate {
    func userPressed(at index: IndexPath)
}

class TravelViewModel{
    
    private var cellViewModels: [TravelListViewCellModel] = [TravelListViewCellModel](){
        didSet{
            self.reloadTableViewClousure?()
        }
    }
    
    var travelInfo: [TravelInfos] = [TravelInfos]()
    
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
    
    var selectedTravel: TravelInfos?
    
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
        return TravelListViewCellModel(title: travel.stitle, description: travel.xbody, image: translateImage(imageUrl: travel.file))
    }
    
    func translateImage(imageUrl: String) -> [String]{
        var strArray: [String] = []
        let lowerStr = imageUrl.lowercased()
        let value = lowerStr.components(separatedBy: "jpg")
        for i in value {
            strArray.append(i + "jpg")
        }
        return strArray 
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
extension TravelViewModel: ViewPressedDelegate {
    func userPressed(at indexPath: IndexPath){
        let travel = self.travelInfo[indexPath.row]
        self.selectedTravel = travel
    }
}
