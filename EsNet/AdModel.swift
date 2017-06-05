//
//  AdModel.swift
//  EsNet
//
//  Created by mengqingzheng on 2017/6/5.
//  Copyright © 2017年 es. All rights reserved.
//

import UIKit

import ObjectMapper

class AdModel: Mappable {
    
    var name: String?
    var url: String?
    
    init() { }
    
    required init?(map: Map) { }
    
    func mapping(map: Map) {
        
        name        <- map["name"]
        url         <- map["url"]
        
    }
}
