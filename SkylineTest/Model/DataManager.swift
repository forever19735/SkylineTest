//
//  DataManager.swift
//  SkylineTest
//
//  Created by apple on 2018/7/20.
//  Copyright © 2018年 Johnny. All rights reserved.
//

import Foundation
class DataManager {
    static var shared = DataManager()
}

extension DataManager {
    typealias requestTravelSuccess = (Travel) -> Void
    
    typealias requestTravelFailure = (Error) -> Void
    
    func requestTravel(_ success: @escaping requestTravelSuccess, failure: requestTravelFailure? = nil
        ){
        let baseUrl = URL(string: "http://data.taipei/opendata/datalist/apiAccess?scope=resourceAquire&rid=36847f3f-deff-4183-a5bb-800737591de5")
        
        let request = URLRequest(url: baseUrl!)
        
        let session = URLSession.shared
        let decoder = JSONDecoder()
        let task = session.dataTask(with: request) { (data, response, error) in
            if let data = data {
                do{
                    let value = try decoder.decode(Travel.self, from: data)
                    success(value)
                }catch{
                    failure?(error)
                }
            }
        }
        task.resume()
        
    }
}
