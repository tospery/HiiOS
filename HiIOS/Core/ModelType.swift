//
//  ModelType.swift
//  HiIOS
//
//  Created by 杨建祥 on 2022/7/18.
//

import Foundation
import ObjectMapper_Hi
import SwifterSwift

// MARK: - 模型协议
public protocol ModelType: Identifiable, Mappable, Hashable, CustomStringConvertible {
    var isValid: Bool { get }
    init()
}

public extension ModelType {

    var isValid: Bool { self.id.hashValue != 0 }
    var description: String {
        self.toJSON().sortedJSONString
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.hashValue == rhs.hashValue
    }
}

public protocol UserType: ModelType {
    var username: String? { get }
    var password: String? { get }
}

public protocol ConfigurationType: ModelType {
    var localization: Localization { get }
}

public struct WrappedModel: ModelType {

    public var id = 0
    public var data: Any?
    
    public var isValid: Bool { self.data != nil }
    
    public init() {
    }
    
    public init(_ data: Any? = nil) {
        self.data = data
    }
    
    public init?(map: Map) {
    }
    
    public mutating func mapping(map: Map) {
        data    <- map["data"]
    }
    
    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.description == rhs.description
    }
    
    public var description: String {
        String.init(describing: self.data)
    }

}

public struct ModelContext: MapContext {
    
    public let shouldMap: Bool
    
    public init(shouldMap: Bool = true){
        self.shouldMap = shouldMap
    }

}

