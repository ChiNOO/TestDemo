//
//  ProductTableViewCell.swift
//  DemoEComerce
//
//  Created by Christian Vargas Saavedra on 21/03/21.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageProduct: UIImageView!
    @IBOutlet weak var amountProduct: UILabel!
    @IBOutlet weak var nameProduct: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
