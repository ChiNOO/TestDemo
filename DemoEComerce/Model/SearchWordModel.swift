//
//  SearchWordModel.swift
//  DemoEComerce
//
//  Created by Christian Vargas Saavedra on 21/03/21.
//

import UIKit
import ObjectMapper
import RealmSwift


public class SearchWordModel: Object{
    
    @objc dynamic var id : String?
    @objc dynamic var searchWord: String = ""
    
    
    required convenience public init?(map: Map) {
        self.init()
        id = NSUUID().uuidString;
    }
    
    override public static func primaryKey() -> String? {
        return "id"
    }
}
