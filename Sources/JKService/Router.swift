//
//  File.swift
//  
//
//  Created by Jitender Kumar on 11/3/21.
//

import Foundation

public enum Router {
    case getSources
    case getProductIds
    case getProductInfo
    
    var scheme: String {
        switch self {
        case .getSources, .getProductIds, .getProductInfo:
            return "https"
        }
    }
    var host: String {
        switch self {
        case .getSources, .getProductIds, .getProductInfo:
            return "shopicruit.myshopify.com"
        }
    }
    var path: String {
        switch self {
        case .getSources:
            return "/admin/custom_collections.json"
        case .getProductIds:
            return "/admin/collects.json"
        case .getProductInfo:
            return "/admin/products.json"
        }
    }
    var parameters: [URLQueryItem] {
        let accessToken = "c32313df0d0ef512ca64d5b336a0d7c6"
        switch self {
        case .getSources:
            return [URLQueryItem(name: "page", value: "1"),
                    URLQueryItem(name: "access_token", value: accessToken)]
        case .getProductIds:
            return [URLQueryItem(name: "page", value: "1"),
                    URLQueryItem(name: "collection_id", value: "68424466488"),
                    URLQueryItem(name: "access_token", value: accessToken)]
        case .getProductInfo:
            return [URLQueryItem(name: "ids", value: "2759162243,2759143811"),
                    URLQueryItem(name: "page", value: "1"),
                    URLQueryItem(name: "access_token", value: accessToken)]
        }
    }
    var method: String {
        switch self {
        case .getSources, .getProductIds, .getProductInfo:
            return "GET"
        }
    }
}
