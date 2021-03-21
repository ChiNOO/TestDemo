//
//  ProductItem.swift
//  DemoEComerce
//
//  Created by Christian Vargas Saavedra on 21/03/21.
//


import UIKit

class ProductItem {
    
    static func initCell(tableView: UITableView, indexPath: IndexPath, product: ProductModel) -> UITableViewCell{
        let cell : ProductTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ProductTableViewCell
        
        cell.nameProduct.text = product.nameProduct
        cell.amountProduct.text = product.amountProduct.description
        cell.imageView?.load(url: URL(string: product.imageProduct)!)

        
        return cell
        
    
    }
    
}
