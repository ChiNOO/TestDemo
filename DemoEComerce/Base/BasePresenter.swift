//
//  BasePresenter.swift
//  DemoEComerce
//
//  Created by Christian Vargas Saavedra on 21/03/21.
//

import UIKit
import Alamofire
import ObjectMapper
import Realm
import RealmSwift

class BasePresenter: NSObject {

    var realm: Realm?
    
    override init() {
        let defaults = UserDefaults()
        var config: Realm.Configuration?
        
        realm = try! Realm(configuration: Realm.Configuration())
    }
    
    
    func loadPresenter(){

    }
    
    func unloadPresenter(){
        
    }
    
    func jsonDescription(dictionary: [String : Any]) -> String{
        let jsonData = try! JSONSerialization.data(withJSONObject: dictionary, options: [])
        return String(data: jsonData, encoding: .utf8)!
    }
    
}
