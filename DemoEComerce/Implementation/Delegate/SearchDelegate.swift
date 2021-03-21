//
//  SearchDelegate.swift
//  DemoEComerce
//
//  Created by Christian Vargas Saavedra on 21/03/21.
//

import Foundation

public protocol SearchDelegate: NSObjectProtocol{
    func loadSearchWords(list: [SearchWordModel])
    func successSearch(list: [ProductModel])
    func errorSearch()
}
