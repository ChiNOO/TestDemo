//
//  ProductModel.swift
//  DemoEComerce
//
//  Created by Christian Vargas Saavedra on 21/03/21.
//

import UIKit
import ObjectMapper
import RealmSwift


public class ProductModel: Object, Mappable{

    
    @objc dynamic var id : String?
    @objc dynamic var nameProduct: String = ""
    @objc dynamic var imageProduct: String = ""
    @objc dynamic var amountProduct: Float = 0.0
    @objc dynamic var ratingProduct: Int = 0

    
    
    
    required convenience public init?(map: Map) {
        self.init()
        id = NSUUID().uuidString;
    }
    
    override public static func primaryKey() -> String? {
        return "id"
    }
    
    public func mapping(map: Map) {
        nameProduct    <- map["title"]
        imageProduct    <- map["image"]
        amountProduct    <- map["price"]
        ratingProduct   <- map["rating"]
    }
    
}

