//
//  Posts.swift
//  MVVMCleanArchitectureWithRxSwift
//
//  Created by Mikal Shrestha on 20/04/2021.
//

import Foundation
import HandyJSON

struct Posts: HandyJSON {
    var userId: Int?
    var id: Int?
    var title:String?
    var body:String?

    
//    enum CodingKeys: String, CodingKey {
//        case userId = "userId"
//        case id = "id"
//        case title = "title"
//        case body = "body"
//    }
    
        
        public init() {
            
        }
}
