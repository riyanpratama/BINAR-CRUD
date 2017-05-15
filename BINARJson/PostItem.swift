//
//  PostItem.swift
//  BINARJson
//
//  Created by Wisnu Riyan Pratama Putra on 5/15/17.
//  Copyright © 2017 Wisnu Riyan Pratama. All rights reserved.
//

import Foundation
import SwiftyJSON

class PostItem: NSObject {
    var userId: String!
    var id: String!
    var title: String!
    var body: String!
    
    init(item: JSON) {
        self.userId = item["userId"].stringValue
        self.id = item["id"].stringValue
        self.title = item["title"].stringValue
        self.body = item["body"].stringValue
    }
}
