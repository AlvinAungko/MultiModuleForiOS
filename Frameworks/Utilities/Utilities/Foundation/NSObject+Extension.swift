//
//  NSObject+Extension.swift
//  Utilities
//
//  Created by Aung Ko Ko on 24/09/2023.
//

import Foundation

extension NSObject: ClassNameProtocol {}

public protocol ClassNameProtocol {
    static var className: String { get }
    var className: String { get }
}

public extension ClassNameProtocol {
    static var className: String {
        return String(describing: self)
    }

    var className: String {
        return type(of: self).className
    }
}
