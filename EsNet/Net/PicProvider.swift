//
//  PicProvider.swift
//  EsNet
//
//  Created by mengqingzheng on 2017/6/5.
//  Copyright © 2017年 es. All rights reserved.
//

import UIKit
import Moya
import RxSwift

let picProvider = RxMoyaProvider<PicAPI>()

public enum PicAPI {
    
    case getPic(type: String)
    
}

extension PicAPI: TargetType {
    
    public var baseURL: URL {
        return URL(string: "http://app.chatm.com")!
    }
    
    public var path: String {
        
        switch self {
            
        case .getPic(_):
            return "/chatm-app/getPic"
        }
    }
    
    public var method: Moya.Method {
        return .get
    }
    
    public var parameters: [String: Any]? {
        
        switch self {
            
        case .getPic(type: let type):
            return ["type": type]
        }
    }
    
    public var parameterEncoding: ParameterEncoding { return URLEncoding.default }
    
    public var task: Task { return .request }
    
    public var validate: Bool { return false }
    
    public var sampleData: Data { return "".data(using: String.Encoding.utf8)! }
    
}
