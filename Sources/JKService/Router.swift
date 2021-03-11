//
//  Router.swift
//  
//
//  Created by Jitender Kumar on 11/3/21.
//

import Foundation

struct Constants {
    let scheme = "https"
    let host = "dummyurl.com"
}

struct EndPoint {
    let getSources = "/getSources.json"
    let getProductIds = "/getProductIds.json"
    let getProductInfo = "/getProductInfo.json"
}

struct RequestMethod {
    let get = "GET"
    let post = "POST"
    
    let create = "CREATE"
    let delete = "DELETE"

    let put = "PUT"
    let connect = "CONNECT"
    let option = "OPTIONS"
    let track = "TRACE"
    let patch = "PATCH"
    let head = "HEAD"
}

public enum Router {
    case getSources
    case getProductIds
    case getProductInfo
    
    var scheme: String {
        switch self {
        case .getSources, .getProductIds, .getProductInfo:
            return Constants().scheme
        }
    }
    var host: String {
        switch self {
        case .getSources, .getProductIds, .getProductInfo:
            return Constants().host
        }
    }
    var path: String {
        switch self {
        case .getSources:
            return EndPoint().getSources
        case .getProductIds:
            return EndPoint().getProductIds
        case .getProductInfo:
            return EndPoint().getProductInfo
        }
    }
    var method: String {
        switch self {
        case .getSources, .getProductIds, .getProductInfo:
            return RequestMethod().get
        }
    }
}
