//
//  Protocols.swift
//  SkylineTest
//
//  Created by apple on 2018/7/21.
//  Copyright © 2018年 Johnny. All rights reserved.
//

import Foundation
public enum HTTPMethod: String {
    case options = "OPTIONS"
    case get     = "GET"
    case head    = "HEAD"
    case post    = "POST"
    case put     = "PUT"
    case patch   = "PATCH"
    case delete  = "DELETE"
    case trace   = "TRACE"
    case connect = "CONNECT"
}
