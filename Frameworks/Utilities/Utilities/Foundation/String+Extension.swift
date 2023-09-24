//
//  String+Extension.swift
//  Utilities
//
//  Created by Aung Ko Ko on 24/09/2023.
//

import Foundation

extension String {
    public var asTrimmed: String {
        trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
    public func escape() -> String {
        let allowedCharacters = addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        return allowedCharacters
    }
}
