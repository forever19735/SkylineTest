//
//  TarvelApi.swift
//  SkylineTest
//
//  Created by apple on 2018/7/29.
//  Copyright © 2018年 Johnny. All rights reserved.
//

import Foundation


enum NetworkEnviroment {
    case qa
    case production
    case staging
}

public enum TravelApi {
    case list()
}

extension TravelApi: EndPointType {
    var baseURL: URL {
        guard let url = URL(string: "http://data.taipei/opendata/datalist/apiAccess?scope=resourceAquire&rid=36847f3f-deff-4183-a5bb-800737591de5") else {
            fatalError("baseURL could not be configured.")
        }
        return url
    }
    
    var path: String {
        switch self {
        case .list:
            return ""
        }
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var task: HTTPTask {
        return .request
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
    
    
}
