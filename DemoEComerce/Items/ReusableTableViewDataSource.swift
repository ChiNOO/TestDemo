//
//  ReusableTableViewDataSource.swift
//  DemoEComerce
//
//  Created by Christian Vargas Saavedra on 21/03/21.
//

import UIKit
import RealmSwift

protocol ReusableTableViewDelegate{
    
}

class ReusableTableViewDataSource: NSObject, UITableViewDataSource, UITableViewDelegate{
    
    var items: [Object] = []
    var tableView: UITableView?
    var delegate: ReusableTableViewDelegate?
    var nibName: String?
    
    init(tableView: UITableView, delegate: ReusableTableViewDelegate, nibName: String, cellName: String) {
        super.init()
        self.tableView = tableView
        self.tableView?.dataSource = self
        self.tableView?.delegate = self
        self.delegate = delegate
        self.nibName = nibName
        
        let nib = UINib(nibName: nibName, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: cellName)
        tableView.backgroundColor = UIColor.clear
    }
    
    func update(items: [Object]){
        self.items.removeAll()
        self.items = items
        self.tableView?.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell: UITableViewCell?
        
        switch self.nibName {
        case "SearchItem":
            cell = SearchWordItem.initCell(tableView: tableView, indexPath: indexPath, searchWord: items[indexPath.row] as! SearchWordModel)
            
        case "ProductItem":
            cell = ProductItem.initCell(tableView: tableView, indexPath: indexPath, product: items[indexPath.row] as! ProductModel)
        default:
            cell = UITableViewCell()
        }
        
        return cell!
    }
}
