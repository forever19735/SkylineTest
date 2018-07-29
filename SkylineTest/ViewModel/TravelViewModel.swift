//
//  TravelModel.swift
//  SkylineTest
//
//  Created by apple on 2018/7/20.
//  Copyright © 2018年 Johnny. All rights reserved.


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
//    weak var loadingStatusDelegate: ViewModelLoadingStatusDelegate?

    private var cellViewModels: [TravelListViewCellModel] = [TravelListViewCellModel](){
        didSet{
            self.reloadTableViewClousure?()
            if cellViewModels.isEmpty {
                DispatchQueue.main.async {
//                    self.loadingStatusDelegate?.showEmptyView(with: nil)
                }
            }
        }
    }
    
    var travelInfo: [Travel] = [Travel]()
    
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
            self.showAlertClosure?()
          
        }
    }
    
    var selectedTravel: Travel?
    
    var reloadTableViewClousure: (()->())?
    var updateLodingStatus: (()->())?
    var showAlertClosure: (()->())?
    
    func initFetch() {
        self.isLoading = true

        NetworkManager.shared.getTravels { (travels, error) in
            self.isLoading = false

            if let error = error {
                self.alertMessage = error
            }
            
            if let travels = travels {
                self.processFetchedTravel(travels: travels)
            }
        }

    }
    
    func getCellViewModel(at indexPath: IndexPath) -> TravelListViewCellModel {
        return cellViewModels[indexPath.row]
    }
    
    func createCellViewModel(travel: Travel) -> TravelListViewCellModel {
        return TravelListViewCellModel(title: travel.stitle, description: travel.xbody, image: translateImage(imageUrl: travel.file))
    }
    
    private func translateImage(imageUrl: String) -> [String] {
        var strArray: [String] = []
        let lowerStr = imageUrl.lowercased()
        let value = lowerStr.components(separatedBy: "jpg")
        for i in value {
            strArray.append(i + "jpg")
        }
        return strArray
    }
    
    private func processFetchedTravel(travels: [Travel]) {
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
