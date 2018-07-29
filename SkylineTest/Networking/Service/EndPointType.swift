//
//  EndPointType.swift
//  SkylineTest
//
//  Created by apple on 2018/7/29.
//  Copyright © 2018年 Johnny. All rights reserved.
//

import Foundation

public enum NetworkError: String, Error {
    case parametersNil = "Parameters were nil."
    case encodingFailed = "Paramter encoding failed."
    case missingURL = "URL is nil."
}

protocol EndPointType {
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var task: HTTPTask { get }
    var headers: HTTPHeaders? { get }
}
