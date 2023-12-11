//
//  List.swift
//  HiIOS
//
//  Created by 杨建祥 on 2022/7/18.
//

import Foundation
import ObjectMapper_Hi

public struct List<Item: ModelType>: ModelType {

    public var id = 0
    public var hasNext = false
    public var count = 0
    public var items = [Item].init()

    public init() {
    }

    public init?(map: Map) {
    }

    mutating public func mapping(map: Map) {
        if let compatible = self as? ListCompatible {
            count = compatible.count(map: map)
            items = compatible.items(map: map)
            hasNext = compatible.hasNext(map: map)
        } else {
            items       <- map["items"]
            count       <- map["count"]
            hasNext     <- map["has_next"]
        }
    }

}

public protocol ListCompatible {
    func hasNext(map: Map) -> Bool
    func count(map: Map) -> Int
    func items<MyItem: ModelType>(map: Map) -> [MyItem]
}

extension ListCompatible {
    public func hasNext(map: Map) -> Bool {
        var hasNext: Bool?
        hasNext   <- map["has_next"]
        return hasNext ?? false
    }
    
    public func count(map: Map) -> Int {
        var count: Int?
        count   <- map["count"]
        return count ?? 0
    }

    public func items<MyItem>(map: Map) -> [MyItem] where MyItem: ModelType {
        var items: [MyItem]?
        items         <- map["items"]
        return items ?? []
    }
}
