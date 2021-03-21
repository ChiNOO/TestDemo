//
//  SearchWordTableViewCell.swift
//  DemoEComerce
//
//  Created by Christian Vargas Saavedra on 21/03/21.
//

import UIKit

class SearchWordTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var searchWordLabel: UILabel!
    @IBOutlet weak var deleteButton: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
