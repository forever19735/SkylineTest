//
//  Travel.swift
//  SkylineTest
//
//  Created by apple on 2018/7/20.
//  Copyright © 2018年 Johnny. All rights reserved.
//

import Foundation

struct TravelApiResponse: Decodable {
    let result: TravelResponse
}

struct TravelResponse: Decodable {
    
    let limit, offset, count: Int
    
    let sort: String
   
    let results: [Travel]
}

struct Travel: Decodable {
    
    let _id: String
    
    let RowNumber: String
    
    let CAT1: String
    
    let CAT2: String
    
    let stitle: String
    
    let xbody: String
    
    let file: String
    
    let info: String?
    
    let MRT: String?
    
    let longitude: String
    
    let latitude: String
    
}

