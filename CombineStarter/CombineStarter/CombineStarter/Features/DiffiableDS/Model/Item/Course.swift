//
//  Course.swift
//  CombineStarter
//
//  Created by Aung Ko Ko on 29/09/2023.
//

import Foundation

enum ItemType: Hashable {
    case itemTypeForCourseSection([Course])
}

struct Course: Codable, Hashable {
    
    var identifier = UUID()
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
}
