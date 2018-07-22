//
//  Router.swift
//  SkylineTest
//
//  Created by apple on 2018/7/20.
//  Copyright © 2018年 Johnny. All rights reserved.
//

import Alamofire

typealias Object = [String: Any]

enum Router {
    case getTravel()

}

extension Router: URLRequestConvertible {
    
    var baseURL: URL {
        return URL(string: "http://data.taipei/opendata/datalist/apiAccess?scope=resourceAquire&rid=36847f3f-deff-4183-a5bb-800737591de5")!
    }
    
    var method: Alamofire.HTTPMethod {
        switch self {
        case .getTravel:
            
            return .get
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        switch self {
        case .getTravel():
            var urlRequest = URLRequest(url: baseURL)
            urlRequest.httpMethod = method.rawValue
            
            return urlRequest
        }
    }
}
