//
//  TargetType+Extension.swift
//  EsNet
//
//  Created by mengqingzheng on 2017/6/5.
//  Copyright © 2017年 es. All rights reserved.
//

import UIKit
import Moya

/// key
public extension TargetType {
    
    var cacheKey: String {
        
        let urlStr = baseURL.appendingPathComponent(path).absoluteString
        
        var sortParams = ""
        
        if let params = parameters {
            /// sort
            let sortArr = params.keys.sorted { (str1, str2) -> Bool in
                return str1 < str2
            }
            
            for str1 in sortArr {
                if let value = params[str1] {
                    sortParams = sortParams.appending("\(str1)=\(value)")
                } else {
                    sortParams = sortParams.appending("\(str1)=")
                }
            }
        }
        
        return urlStr.appending("?\(sortParams)")
        
    }
}
