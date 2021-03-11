//
//  File.swift
//  
//
//  Created by Jitender Kumar on 11/3/21.
//

import Foundation
public struct ModelItem: Codable {
    let title: String
    let id: Int
}

struct ModelItemId: Codable {
    let productId: Int
  
    enum CodingKeys: String, CodingKey {
        case productId = "product_id"
    }
}
struct CollectionInfo: Codable {
    let title: String
    let productType: String
    let variants: [VariantsInfo]
    let image: ImageInfo
    
    enum CodingKeys: String, CodingKey {
        case title
        case productType = "product_type"
        case variants
        case image
    }
}

struct VariantsInfo: Codable {
    let title: String
    let inventoryQuantity: Int
    
    enum CodingKeys: String, CodingKey {
        case title
        case inventoryQuantity = "inventory_quantity"
    }
}

struct ImageInfo: Codable {
    let path: String
    
    enum CodingKeys: String, CodingKey {
        case path = "src"
    }
}
