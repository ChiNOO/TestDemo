//
//  SearchWordItem.swift
//  DemoEComerce
//
//  Created by Christian Vargas Saavedra on 21/03/21.
//

import UIKit

class SearchWordItem {
    
    static func initCell(tableView: UITableView, indexPath: IndexPath, searchWord: SearchWordModel) -> UITableViewCell{
        let cell : SearchWordTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SearchWordTableViewCell
        
        cell.searchWordLabel.text = searchWord.searchWord

        
        return cell
        
    
    }
    
}
