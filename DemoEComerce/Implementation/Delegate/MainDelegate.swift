//
//  MainDelegate.swift
//  DemoEComerce
//
//  Created by Christian Vargas Saavedra on 21/03/21.
//

import Foundation

public protocol MainDelegate: NSObjectProtocol{
    func loadSearch(list: [ProductModel])
}
