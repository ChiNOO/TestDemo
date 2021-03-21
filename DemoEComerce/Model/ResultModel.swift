//
//  ResultModel.swift
//  DemoEComerce
//
//  Created by Christian Vargas Saavedra on 21/03/21.
//

import UIKit
import ObjectMapper


class ResultModel: NSObject, Mappable{
  
    var totalResult: Int = 0
    var page: Int = 0
    var productsList: [ProductModel] = []
    
    required public init?(map: Map) {
        
    }

    func mapping(map: Map) {
        totalResult     <- map["totalResults"]  
        page            <- map["page"]
        productsList    <- map["items"]
    }
    
}

