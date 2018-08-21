//
//  AllbumsTableViewCell.swift
//  MyAppMP3
//
//  Created by Danhloc on 8/9/18.
//  Copyright © 2018 Danhloc. All rights reserved.
//

import UIKit

class AllbumsTableViewCell: UITableViewCell {

    @IBOutlet weak var imgYoutube: UIImageView!
    
    @IBOutlet weak var lblYoutube: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
