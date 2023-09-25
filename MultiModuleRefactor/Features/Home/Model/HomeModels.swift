//
//  HomeModels.swift
//  MultiModuleRefactor
//
//  Created by Aung Ko Ko on 24/09/2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum Home {
    
    enum Something {
        struct Response {
            var statusCode: String
        }
        
        struct ViewModel {
            var studentList: [StudentNetworkModel]?
        }
    }
}

struct BaseStrapiModel<T: Codable>: Codable {
    let data: [T]?
    let meta: MetaModel?
}

struct BaseEntityModel<T: Codable>: Codable {
    let id: Int?
    let attributes: T?
}

struct StudentNetworkModel: Codable {
    let studentTitle: String?
    let studentName: String?
    
    enum CodingKeys: String, CodingKey {
        case studentTitle = "student_title"
        case studentName = "student_name"
    }
}

struct MetaModel: Codable {
    let pagination: PaginationModel?
}

struct PaginationModel: Codable {
    let page: Int?
    let pageSize: Int?
    let pageCount: Int?
    let total: Int?
}
