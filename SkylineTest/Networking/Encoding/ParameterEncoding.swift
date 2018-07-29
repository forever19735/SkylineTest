//
//  ParameterEncoding.swift
//  SkylineTest
//
//  Created by apple on 2018/7/29.
//  Copyright © 2018年 Johnny. All rights reserved.
//

import Foundation

public typealias Parameters = [String: Any]

public protocol ParameterEncoder {
    static func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws
}
