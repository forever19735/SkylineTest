//
//  DataManager.swift
//  SkylineTest
//
//  Created by apple on 2018/7/20.
//  Copyright © 2018年 Johnny. All rights reserved.
//

import Foundation
import Alamofire
enum APIError: String, Error {
    case noNetwork = "網路連線異常"
}

class DataManager {
    static var shared = DataManager()
}

extension DataManager {
    typealias requestTravelSuccess = (Travel) -> Void
    
    typealias requestTravelFailure = (APIError) -> Void
    
    func requestTravel(_ success: @escaping requestTravelSuccess, failure: requestTravelFailure? = nil
        ) -> Request{
        let endPoint = Router.getTravel()
        return Alamofire.request(endPoint).validate().responseJSON(completionHandler: { (response) in
            switch response.result {
            case .success(_):
                if let data = response.data{
                    let decoder = JSONDecoder()
                    
                    do {
                        let value = try decoder.decode(Travel.self, from: data)
                        success(value)
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            case .failure(let error):
                failure?(error as? APIError ?? APIError.noNetwork)
            }
        })
        
    }
}
