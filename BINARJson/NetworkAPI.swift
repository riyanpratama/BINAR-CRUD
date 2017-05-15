//
//  NetworkAPI.swift
//  BINARJson
//
//  Created by Wisnu Riyan Pratama Putra on 5/15/17.
//  Copyright © 2017 Wisnu Riyan Pratama. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

typealias SuccessResponse = (JSON?) -> Void
typealias ErrorResponse = (String?) -> Void

class NetworkAPI {
    static let instance = NetworkAPI()
    
    init() {
        Alamofire.SessionManager.default.session.configuration.timeoutIntervalForRequest = 30
        Alamofire.SessionManager.default.session.configuration.timeoutIntervalForResource = 30
    }
    
    func request(url: String, success: @escaping SuccessResponse, error: @escaping ErrorResponse) {
        Alamofire.request(url).responseJSON { (response) in
            print(response.data!)
            if response.result.error == nil {
                let json = JSON(response.result.value!)
                success(json)
            }
            else {
                error("error getting data")
            }
            
        }
    }
}

